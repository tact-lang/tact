struct SFirst {
    i: Int;
}

struct SSecond {
    prev: SFirst;
    b: Bool;
}

contract StructJump {
    data: SSecond;

    init() {
        self.data = SSecond{
            prev: SFirst{
                i: 555,
            },
            b: true,
        };
    }
}