struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct HasNestedOptional {
    nested: NestedOptional?;
}

contract TestNestedOptional {
    data: HasNestedOptional;

    init() {
        self.data = HasNestedOptional{};
    }

    receive() {
        self.data = HasNestedOptional{ nested: NestedOptional{foo:1,bar:true} };
    }
}