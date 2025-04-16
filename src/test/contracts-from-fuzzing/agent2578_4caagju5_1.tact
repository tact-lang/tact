struct DeeplyNested {
    lv1: L1;
}

struct L1 {
    lv2: L2;
}

struct L2 {
    lv3: L3;
}

struct L3 {
    flag: Bool;
    number: Int;
    text: String;
}

contract TestNested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            lv1: L1{
                lv2: L2{
                    lv3: L3{
                        flag: true,
                        number: 42,
                        text: "hello"
                    }
                }
            }
        };
    }
}