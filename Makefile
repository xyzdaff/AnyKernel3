DEVICE := $(shell echo ${DEVICE})
KERNAME := $(shell echo ${KERNAME})
BRANCH := $(shell git -C .. rev-parse --abbrev-ref HEAD)

NAME := ${KERNAME}-$(DEVICE)
DATE := $(shell date "+%Y%m%d")
ZIP := $(NAME)-$(DATE).zip
EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	sed -i 's/universal/${DEVICE}/g' anykernel.sh
	zip -r9 "$@" . -x $(EXCLUDE)
	echo "Done creating ZIP: $(ZIP)"

clean:
	@rm -vf *.zip*
	@rm -vf *.gz-dtb*
	@rm -vf modules/vendor/lib/modules/*.ko
	echo "Cleaning done."
