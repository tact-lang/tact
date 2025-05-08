trait TTrait {
    foo: Int;
}

contract TraitInherit with TTrait {
    foo: Int;

    init() {
        self.foo = 42;
    }
}