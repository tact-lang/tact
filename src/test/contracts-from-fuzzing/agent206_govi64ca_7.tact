struct DeepOptional {
    a: Int?;
    b: InnerOptional?;
}

struct InnerOptional {
    c: Bool?;
    d: Leaf?;
}

struct Leaf {
    e: String?;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            a: null,
            b: InnerOptional{
                c: null,
                d: Leaf{
                    e: "foo"
                }
            }
        };
    }
}
