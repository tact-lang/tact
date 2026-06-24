struct InnerStruct {
    level: Int;
    flag: Bool;
    text: String;
    sub: SubStruct;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract ComplexNested {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            level: 10,
            flag: true,
            text: "Test",
            sub: SubStruct{
                x: 5,
                y: false,
            },
        };
    }
}