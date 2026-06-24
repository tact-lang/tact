message(99) FooMsg { num: Int }

struct BarStruct {
    x: Bool?;
    text: String;
}

contract MixCompositeOptReq {
    mReq: FooMsg;
    mOpt: FooMsg?;
    sReq: BarStruct;
    sOpt: BarStruct?;

    init() {
        self.mReq = FooMsg{ num: 1 };
        self.mOpt = null;
        self.sReq = BarStruct{ x: true, text: "Hi" };
        self.sOpt = null;
    }
}