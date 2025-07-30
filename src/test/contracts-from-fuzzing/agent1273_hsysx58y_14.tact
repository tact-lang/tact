struct InnerNested {
    s: SecondLevel;
}

struct SecondLevel {
    t: ThirdLevel;
}

struct ThirdLevel {
    i: Int;
    b: Bool?;
    s: String;
}

contract TestContract {
    nested: InnerNested;

    init() {
        self.nested = InnerNested{
            s: SecondLevel{
                t: ThirdLevel{
                    i: 99,
                    b: null,
                    s: "test"
                }
            }
        };
    }
}