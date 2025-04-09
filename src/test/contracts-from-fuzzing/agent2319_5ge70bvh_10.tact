struct DefaultsStruct {
    foo: Int = 404;
    bar: Bool = false;
    name: String = "none";
    maybeVal: Int?;
}

contract TestContract {
    stuff: DefaultsStruct;

    init() {
        self.stuff = DefaultsStruct{
            foo: 1,
            bar: true,
            name: "overwrite",
            maybeVal: 0,
        };
    }
}
