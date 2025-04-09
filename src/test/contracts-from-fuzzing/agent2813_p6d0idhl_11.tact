contract InitWithStructs {
    foo: Int;
    bar: SubStruct;

    init() {
        self.foo = 12;
        self.bar = SubStruct{
            x: 5,
            y: "abc"
        };
    }
}

struct SubStruct {
    x: Int;
    y: String;
}
