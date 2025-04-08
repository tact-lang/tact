struct InnerStruct {
    i1: Int;
    i2: String?;
}

struct MidStruct {
    m1: Bool;
    m2: Int;
    m3: InnerStruct;
}

contract DeepChain {
    data: MidStruct;

    init() {
        self.data = MidStruct{
            m1: true,
            m2: 42,
            m3: InnerStruct{ i1: 9, i2: null }
        };
    }

    receive() {
        let _ = self.data.m3.i2;
    }
}