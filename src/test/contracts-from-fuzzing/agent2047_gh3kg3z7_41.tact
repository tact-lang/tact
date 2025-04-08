struct Inherited {
    foo: Int;
}

contract ShadowDefault {
    data: Inherited = Inherited{foo: 1};

    init() {
        self.data = Inherited{ foo: 99 };
    }
}