struct DeepNested {
    nest: Inner;
}

struct Inner {
    optionalNest: Innermost?;
}

struct Innermost {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            nest: Inner{
                optionalNest: Innermost{
                    val1: 7,
                    val2: true
                }
            }
        };
    }
}
