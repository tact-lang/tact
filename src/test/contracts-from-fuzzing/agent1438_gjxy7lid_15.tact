struct Layer3 {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
}

struct Layer2 {
    l3: Layer3;
    flag: Bool;
}

struct Layer1 {
    l2: Layer2;
    s: String;
}

contract DeepSerialization {
    val: Layer1;

    init() {
        self.val = Layer1{
            l2: Layer2{
                l3: Layer3{
                    a: 10,
                    b: 65535,
                    c: -5000,
                },
                flag: true,
            },
            s: "deep",
        };
    }
}