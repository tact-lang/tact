trait ParentTrait {
    foo: Int;
}

contract InheritFields with ParentTrait {
    foo: Int;

    init() {
        self.foo = 42;
    }
}