struct Compose {
    i1: Int as uint8;
    i2: Int as int32;
    b1: Bool;
    sopt: SubOpt?;
}

struct SubOpt {
    flag: Bool;
    val: Int?;
}

contract SerializeAndNull {
    data: Compose;

    init() {
        self.data = Compose{
            i1: 5,
            i2: -10,
            b1: false,
            sopt: null
        };
    }
}