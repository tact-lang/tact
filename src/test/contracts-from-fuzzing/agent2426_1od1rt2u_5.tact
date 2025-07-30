struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

contract OptionalContractField {
    val: Inner?;

    init() {
        self.val = Inner{
            y: InnerMost{
                z: 1
            }
        };
    }
}