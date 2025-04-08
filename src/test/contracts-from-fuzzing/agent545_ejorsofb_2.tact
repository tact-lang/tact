struct DeepNested {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterStruct {
    d: Int;
    e: DeepNested;
    f: Bool?;
}

contract StructStorage {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            d: 7,
            e: DeepNested{
                a: 1,
                b: true,
                c: "hello"
            },
            f: false
        };
    }
}
