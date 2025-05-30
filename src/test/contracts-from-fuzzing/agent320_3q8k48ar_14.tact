struct MixCrazy {
    id: Int as uint32;
    optVal: Int?;
    flag: Bool = false;
    tiny: Int as uint4 = 3;
    msg: String?; 
}

contract MixCrazyContract {
    data: MixCrazy;
    init() {
        self.data = MixCrazy{
            id: 42,
            optVal: null,
            msg: "Hi"
        };
    }
}