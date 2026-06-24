struct OuterStruct {
    x: Int;
    y: InnerStruct;
}

struct InnerStruct {
    z: Int;
    s: InnerInnerStruct;
}

struct InnerInnerStruct {
    flag: Bool;
    name: String;
    addr: Address;
}

contract HighlyNested {
    state: OuterStruct;
    init() {
        self.state = OuterStruct{
            x: 7,
            y: InnerStruct{
                z: 3,
                s: InnerInnerStruct{
                    flag: true,
                    name: "nested",
                    addr: myAddress(),
                },
            },
        };
    }
}