struct DeepNested {
    a: Int;
    b: Int?;
}

struct Layer2 {
    dn: DeepNested;
    flag: Bool;
}

struct Layer1 {
    l2: Layer2;
    message: String;
}

contract Test {
    record: Layer1;

    init() {
        self.record = Layer1{
            l2: Layer2{
                dn: DeepNested{
                    a: 1,
                    b: 2,
                },
                flag: false,
            },
            message: "test",
        };
    }
}