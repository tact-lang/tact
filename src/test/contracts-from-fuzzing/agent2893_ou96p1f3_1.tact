struct DeepNested {
    f1: Int;
    f2: OptionalNested;
}

struct OptionalNested {
    sub1: InnerOptional?; // Nested optional field inside struct
}

struct InnerOptional {
    val: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            f1: 1,
            f2: OptionalNested{
                sub1: InnerOptional{
                    val: true
                }
            }
        };
    }
}
