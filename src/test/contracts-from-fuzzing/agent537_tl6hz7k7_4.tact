struct DeeplyNested3 {
    d1: Int;
    d2: DeeplyNested2;
}

struct DeeplyNested2 {
    d1: Int?;
    d2: DeeplyNested1;
}

struct DeeplyNested1 {
    d1: Bool;
    d2: String?;
}

contract TestContract {
    nested3: DeeplyNested3;

    init() {
        self.nested3 = DeeplyNested3{
            d1: 1,
            d2: DeeplyNested2{
                d1: null,
                d2: DeeplyNested1{ d1: true, d2: "hello" }
            }
        };
    }

    receive() {
        self.nested3 = self.nested3; // no change
    }
}
