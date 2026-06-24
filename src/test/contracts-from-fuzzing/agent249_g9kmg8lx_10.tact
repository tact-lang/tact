struct DeepInner {
    a: Int as uint8;
    b: Bool;
}

struct Middle {
    innerOpt: DeepInner?;
    z: Int as int16;
}

contract DeepOptionalSerial {
    data: Middle;

    init() {
        self.data = Middle{
            innerOpt: DeepInner{
                a: 10,
                b: true
            },
            z: -1000
        };
    }

    receive() {
        if (self.data.innerOpt != null) {
            let _ = self.data.innerOpt!!.a;
        }
    }
}