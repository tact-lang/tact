struct Deep {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    
    nested: InnerMost;
}

struct InnerMost {
    val: Int;
    optVal: String?;
}

contract TestContract {
    deepField: Deep;

    init() {
        self.deepField = Deep{
            f1: 10,
            f2: true,
            f3: "abc",
            f4: myAddress(),
            nested: InnerMost{val: 11, optVal: null}
        };
    }
}