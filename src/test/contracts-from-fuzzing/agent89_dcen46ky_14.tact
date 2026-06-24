struct InnerOpt {
    foo: Int?;
    bar: String?;
}

struct MidOpt {
    inner: InnerOpt?;
}

struct TopOpt {
    mid: MidOpt?;
}

contract Fuzz14 {
    data: TopOpt?;

    init() {
        self.data = null;
    }
}