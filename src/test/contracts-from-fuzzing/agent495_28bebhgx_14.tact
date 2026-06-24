struct DeepNestedOpt {
    v1: Int?;
    v2: Bool?;
}

struct Wrap1 {
    n: DeepNestedOpt?;
}
struct Wrap2 {
    n: Wrap1?;
}
struct Wrap3 {
    n: Wrap2?;
}

contract DeepOptional {
    data: Wrap3;

    init() {
        self.data = Wrap3{
            n: Wrap2{
                n: Wrap1{
                    n: DeepNestedOpt{
                        v1: null,
                        v2: true
                    }
                }
            }
        };
    }
}
