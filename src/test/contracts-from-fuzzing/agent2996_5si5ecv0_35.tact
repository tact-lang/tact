struct OptionInnerSerial {
    a: Int?;
    b: S?
}

struct S {
    x:Int as uint8;
    y:Int as int16;
}

contract OptInnerSer {
    data: OptionInnerSerial;

    init() {
        self.data = OptionInnerSerial{
            a:null,
            b:S{ x:2, y:-1 }
        };
    }
}