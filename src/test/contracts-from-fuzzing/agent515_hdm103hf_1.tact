struct DeepNested {
    innerOpt: Inner?;
    val: Int;
}

struct Inner {
    flag: Bool;
    numberOpt: Int?;
    text: String;
}

contract TestDeep {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            innerOpt: Inner{flag: false, numberOpt: null, text: "x"},
            val: 1
        };
    }
}
