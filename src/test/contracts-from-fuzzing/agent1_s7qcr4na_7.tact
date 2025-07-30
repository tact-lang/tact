contract Test {
    foo: Int;

    init() {
        self.foo = 1;
    }

    get fun getFoo(): Int {
         self.foo = self.foo + 1; // modifying state in getter
         return self.foo;
    }
}
