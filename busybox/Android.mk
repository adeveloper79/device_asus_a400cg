LOCAL_PATH := $(call my-dir)

BUSYBOX_BINARY := busybox

include $(CLEAR_VARS)
LOCAL_MODULE := busybox_binary
LOCAL_MODULE_STEM := $(BUSYBOX_BINARY)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_SRC_FILES := in/$(BUSYBOX_BINARY)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
TOOLS := \
	acpid \
	addgroup \
	adduser \
	adjtimex \
	ar \
	arp \
	arping \
	ash \
	awk \
	basename \
	bbconfig \
	beep \
	blkid \
	brctl \
	bunzip2 \
	bzcat \
	bzip2 \
	cal \
	cat \
	catv \
	chat \
	chattr \
	chgrp \
	chmod \
	chown \
	chpasswd \
	chpst \
	chroot \
	chrt \
	chvt \
	cksum \
	clear \
	cmp \
	comm \
	cp \
	cpio \
	crond \
	cryptpw \
	cttyhack \
	cut \
	date \
	dc \
	dd \
	deallocvt \
	delgroup \
	deluser \
	depmod \
	devmem \
	df \
	dhcprelay \
	diff \
	dirname \
	dmesg \
	dnsd \
	dnsdomainname \
	dos2unix \
	du \
	dumpkmap \
	dumpleases \
	echo \
	ed \
	egrep \
	eject \
	env \
	envdir \
	envuidgid \
	ether-wake \
	expand \
	expr \
	fakeidentd \
	false \
	fbset \
	fbsplash \
	fdflush \
	fdformat \
	fdisk \
	fgrep \
	find \
	findfs \
	flash_eraseall \
	flash_lock \
	flash_unlock \
	flashcp \
	fold \
	free \
	freeramdisk \
	fsck \
	fsck.minix \
	fsync \
	ftpd \
	ftpget \
	ftpput \
	fuser \
	getopt \
	getty \
	grep \
	gunzip \
	gzip \
	halt \
	hd \
	hdparm \
	head \
	hexdump \
	hostid \
	hostname \
	httpd \
	hush \
	hwclock \
	id \
	ifconfig \
	ifdown \
	ifenslave \
	ifplugd \
	ifup \
	inetd \
	init \
	inotifyd \
	install \
	ionice \
	ip \
	ipaddr \
	ipcalc \
	ipcrm \
	ipcs \
	iplink \
	iproute \
	iprule \
	iptunnel \
	kbd_mode \
	kill \
	killall \
	killall5 \
	klogd \
	last \
	length \
	less \
	linux32 \
	linux64 \
	linuxrc \
	ln \
	loadfont \
	loadkmap \
	logger \
	login \
	logname \
	logread \
	losetup \
	lpd \
	lpq \
	lpr \
	ls \
	lsattr \
	lsmod \
	lspci \
	lsusb \
	lzmacat \
	lzop \
	lzopcat \
	makedevs \
	makemime \
	man \
	md5sum \
	mdev \
	mesg \
	microcom \
	mkdir \
	mkdosfs \
	mke2fs \
	mkfifo \
	mkfs.ext2 \
	mkfs.minix \
	mkfs.vfat \
	mknod \
	mkpasswd \
	mkswap \
	mktemp \
	more \
	mount \
	mountpoint \
	msh \
	mt \
	mv \
	nameif \
	nc \
	netstat \
	nice \
	nmeter \
	nohup \
	nslookup \
	ntpd \
	od \
	openvt \
	passwd \
	patch \
	pgrep \
	pidof \
	ping \
	ping6 \
	pipe_progress \
	pivot_root \
	pkill \
	popmaildir \
	poweroff \
	printenv \
	printf \
	ps \
	pscan \
	pwd \
	raidautorun \
	rdate \
	rdev \
	readahead \
	readlink \
	readprofile \
	realpath \
	reformime \
	renice \
	reset \
	resize \
	rm \
	rmdir \
	route \
	rtcwake \
	runsv \
	runsvdir \
	rx \
	script \
	scriptreplay \
	sed \
	sendmail \
	seq \
	setarch \
	setconsole \
	setfont \
	setkeycodes \
	setlogcons \
	setsid \
	setuidgid \
	sh \
	sha1sum \
	sha256sum \
	sha512sum \
	showkey \
	slattach \
	sleep \
	softlimit \
	sort \
	split \
	stat \
	strings \
	stty \
	su \
	sulogin \
	sum \
	sv \
	svlogd \
	swapoff \
	swapon \
	switch_root \
	sync \
	sysctl \
	syslogd \
	tac \
	tail \
	tar \
	taskset \
	tcpsvd \
	tee \
	telnet \
	telnetd \
	test \
	tftp \
	tftpd \
	time \
	timeout \
	top \
	touch \
	tr \
	traceroute \
	traceroute6 \
	true \
	tty \
	ttysize \
	tunctl \
	tune2fs \
	udhcpc \
	udhcpd \
	udpsvd \
	umount \
	uname \
	uncompress \
	unexpand \
	uniq \
	unix2dos \
	unlzma \
	unlzop \
	unzip \
	uptime \
	usleep \
	uudecode \
	uuencode \
	vconfig \
	vi \
	vlock \
	volname \
	wall \
	watch \
	watchdog \
	wc \
	wget \
	which \
	who \
	whoami \
	xargs \
	yes \
	[ \
	[[ \
	zcat

LOCAL_MODULE := busybox_symlinks
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp
LOCAL_REQUIRED_MODULES := busybox_binary
SYMLINKS := $(addprefix $(TARGET_OUT_OPTIONAL_EXECUTABLES)/,$(TOOLS))
$(SYMLINKS): $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(BUSYBOX_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(BUSYBOX_BINARY) $@
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE): $(SYMLINKS)
	$(hide) echo "Fake: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) touch $@

include $(CLEAR_VARS)
LOCAL_MODULE := busybox
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := busybox_symlinks
include $(BUILD_PHONY_PACKAGE)
