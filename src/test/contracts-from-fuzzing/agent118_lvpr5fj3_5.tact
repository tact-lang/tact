struct Foo {
    value: Int = 5;
    optionalNum: Int?;
    flag: Bool = true;
}

contract DefaultsAndOptionals {
    data: Foo;

    init() {
        self.data = Foo{
            optionalNum: null
        };
    }
}