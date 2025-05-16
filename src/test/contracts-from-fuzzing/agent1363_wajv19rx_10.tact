struct L4 {
    dee: Int?;
    pee: Bool;
}

struct L3 {
    layer4: L4?;
    msg: String;
}

struct L2 {
    layer3: L3?;
    count: Int;
}

struct L1 {
    layer2: L2?;
    flag: Bool?;
}

contract DeepChain {
    data: L1;

    init() {
        self.data = L1{
            layer2: L2{
                layer3: L3{
                    layer4: L4{
                        dee: null,
                        pee: true
                    },
                    msg: "deep"
                },
                count: 99
            },
            flag: false
        };
    }
}