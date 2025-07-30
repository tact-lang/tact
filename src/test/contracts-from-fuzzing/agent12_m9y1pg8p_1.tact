contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // valid getter: should compile, reads state, does not modify it
    get fun getFoo(): Int {
        return self.foo;
    }

    // normal function (non-getter) modifying state is allowed
    fun incFoo() {
        self.foo += 1;
    }
}
