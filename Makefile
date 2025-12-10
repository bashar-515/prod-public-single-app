ifneq (,$(wildcard test.make))
	include test.make
    export $(shell sed 's/=.*//' test.make)
endif

module: dist/index.html
	tar czf module.tar.gz meta.json dist

dist/index.html: node_modules
	NODE_ENV=development npm run build

node_modules: package.json
	npm install

setup-linux:
	which npm > /dev/null 2>&1 || (curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs)
