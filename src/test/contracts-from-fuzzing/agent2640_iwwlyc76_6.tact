struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: Nested?;
}

struct Nested {
    n1: Int?;
    n2: InnerMost?;
}

struct InnerMost {
    flag: Bool;
}

contract TestContract {
    test: DeepOptionals;

    init() {
        self.test = DeepOptionals{
            a: 77,
            b: false,
            c: Nested{
                n1: 99,
                n2: InnerMost{
                    flag: true
                }
            }
        };
    }
}
