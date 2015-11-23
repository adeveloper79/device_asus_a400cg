
#include <stdint.h>

#ifndef __BOOTHEADER__
#define __BOOTHEADER__

#define MAGIC_SIZE						(7)
#define	ID_SIZE							(0x28)
#define HEADER_SIZE						(MAGIC_SIZE + 0x1 + ID_SIZE + 0x4 + 0x4)

#define HEAD_PADDING                                            (0x1c8)
#define UNKNOWN_SIZE                                            (0x1e0)

#define CMDLINE_SIZE   						(0x400) //y
#define CMDLINE_END						(HEADER_SIZE + HEAD_PADDING + UNKNOWN_SIZE + CMDLINE_SIZE)
// uint32_t * 4 = 0x10, total: 0x410

#define PADDING1_SIZE						(0xbf0) // (0x1000-0x410)
#define BOOTSTUBSTACK_SIZE					(0x2000)

#define SECTOR_SIZE						(0x200)	// 512


struct bootheader {
        uint8_t magic[MAGIC_SIZE];	// $OS$\0\0\1
        uint8_t xor;			// XOR of first 56 bytes (without this one)
        uint8_t id[ID_SIZE];		// 01 01 38 00 00 00 00 00 00 00 00 00 00 00 00 00 
                                        // 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 
                                        // 00 00 10 01 00 10 10 01 
        uint32_t sectors;
        uint32_t imageType;
        
	uint8_t head_padding[HEAD_PADDING];	// FF FF FF FF .... x 96 + 00 00 00 00 .... x 17 + 00 00 55 AA
	uint8_t unknown[UNKNOWN_SIZE];
	char cmdline[CMDLINE_SIZE];
	uint32_t bzImageSize;
	uint32_t initrdSize;
	uint32_t SPIUARTSuppression;			// unused
	uint32_t SPIType;				// unused
	uint8_t padding1[PADDING1_SIZE];		// 00 00 00 00 ... 
	uint8_t bootstubStack[BOOTSTUBSTACK_SIZE];	// fixed content
};

/* Sanity check for struct size */
typedef char z[(sizeof(struct bootheader) == HEADER_SIZE + HEAD_PADDING + UNKNOWN_SIZE + 0x3000) ? 1 : -1];
// 0x2000 = (size of cmdline + 16 + padding1) + (size of bootstubstack)

#endif
