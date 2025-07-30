struct DeepOptionalNest {
    a: Int?;
}

struct MidOpt {
    nested: DeepOptionalNest?;
}

struct OuterOptStruct {
    mid: MidOpt?;
}

contract DeepOptionalTest {
    data: OuterOptStruct;
    init() {
        self.data = OuterOptStruct{ mid: null };
    }
}
