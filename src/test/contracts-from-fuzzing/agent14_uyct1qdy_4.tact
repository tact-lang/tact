contract GetterTest {
    foo: Int;

    init() {
        self.foo = 1;
    }

    fun modifyIndirect(): Int {
         self.foo = self.foo + 1;
         return self.foo;
    }

    get fun testGetter(): Int {
         return self.modifyIndirect();
    }

    get fun readFoo(): Int {
         return self.foo;
    }
}
