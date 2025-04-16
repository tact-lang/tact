struct DeeplyNested {
    id: Int;
    data: MiddleLayer;
}

struct MiddleLayer {
    name: String;
    meta: InnerLayer;
}

struct InnerLayer {
    flag: Bool;
    description: String;
    owner: Address;
}

contract ComplexNested {
    obj: DeeplyNested;

    init() {
        self.obj = DeeplyNested{
            id: 10,
            data: MiddleLayer{
                name: "middle",
                meta: InnerLayer{
                    flag: true,
                    description: "deep inside",
                    owner: myAddress()
                }
            }
        };
    }
}