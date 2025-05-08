struct DeepOptional {
    sub1: Int?;
    sub2: String?;
    sub3: Bool?;
}

struct Outer {
    inner: DeepOptional?;
}

contract TestContract {
    nestedOpt: Outer;

    init() {
        self.nestedOpt = Outer{inner: null};
    }
}