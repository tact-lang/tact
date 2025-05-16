struct OptWithDefault {
    foo: Int? = null;
    bar: Bool? = null;
    msg: String = "hi";
}

contract StructWithOptionalDefaults {
    value: OptWithDefault;

    init() {
        self.value = OptWithDefault{
            foo: null, bar: null, msg: "hello" 
        };
    }
}
