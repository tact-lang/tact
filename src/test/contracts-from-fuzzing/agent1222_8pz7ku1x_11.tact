struct Layer3 {
    count: Int = 3;
    name: String = "layer3";
    flag: Bool = true;
}

struct Layer2 {
    nested: Layer3;
    desc: String = "layer2";
    optionalStr: String?;
    enabled: Bool = false;
}

struct Layer1 {
    nested: Layer2;
    owner: String = "none";
    active: Bool = true;
    optionalVal: Int?;
}

contract TestContract {
    deepnest: Layer1;

    init() {
        self.deepnest = Layer1{
            nested: Layer2{
                nested: Layer3{
                    count: 999,
                    name: "deep",
                    flag: false,
                },
                desc: "middle",
                optionalStr: "set",
                enabled: true,
            },
            owner: "carol",
            active: false,
            optionalVal: 42,
        };
    }

    receive() {
        let v = self.deepnest.nested.nested.count;
    }
}