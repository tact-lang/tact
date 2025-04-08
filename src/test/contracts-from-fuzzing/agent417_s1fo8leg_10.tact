struct InnerMost {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Inner2 {
    imm: InnerMost;
}

struct Inner1 {
    i2: Inner2;
}

struct Inner0 {
    i1: Inner1;
}

contract TestContract {
    deeplyNested: Inner0;

    init() {
        self.deeplyNested = Inner0{
            i1: Inner1{
                i2: Inner2{
                    imm: InnerMost{
                        a: null,
                        b: true,
                        c: "deep",
                        d: null
                    }
                }
            }
        };
    }
}