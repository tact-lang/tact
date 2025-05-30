struct DefaultsStruct {
    foo: Int;
    optBool: Bool? = true;
    optStr: String? = "bar";
}

contract DefaultValuesComposite {
    state: DefaultsStruct;

    init() {
        self.state = DefaultsStruct{
            foo: 10,
        };
    }
}