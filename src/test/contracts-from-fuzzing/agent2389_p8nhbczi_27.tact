struct MidOpt {
    x: Int;
    y: Int?;
}

struct OutOpt {
    inner: MidOpt?;
    z: Bool;
}

contract OptMidStruct {
    data: OutOpt;

    init() {
        self.data = OutOpt{
            inner: null,
            z: true
        };
    }
}