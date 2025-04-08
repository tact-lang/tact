struct OptionalsStruct {
    foo: Int?;
    bar: Bool?;
}

contract ManyOptionals {
    s: OptionalsStruct;

    init() {
        self.s = OptionalsStruct{
            foo: null,
            bar: null,
        };
    }
}
