struct InnerStruct {
    x: Int?;
    y: Bool;
}

struct MiddleStruct {
    m: InnerStruct?;
    flag: Bool;
}

contract TestContract {
    data: MiddleStruct;
    init() {
        self.data = MiddleStruct{ m: null, flag: true };
    }
}
