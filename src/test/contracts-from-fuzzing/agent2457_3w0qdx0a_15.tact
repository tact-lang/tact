struct StringStruct {
    s: String;
    t: String;
}

contract StringsPersist {
    field: StringStruct;

    init() {
        self.field = StringStruct{
            s: "hello",
            t: "world"
        };
    }
}