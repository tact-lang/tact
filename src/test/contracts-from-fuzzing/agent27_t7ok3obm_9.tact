struct OpStr1 {
    s: String?;
    a: Int?;
}

struct OpStr2 {
    x: Bool;
    inner: OpStr1?;
}

struct OpStr3 {
    z: OpStr2?;
}

contract OptionalsDeep {
    info: OpStr3;

    init() {
        self.info = OpStr3{
            z: OpStr2{
                x: true,
                inner: OpStr1{
                    s: "hello",
                    a: null
                }
            }
        };
    }
}
