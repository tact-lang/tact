struct IntBoolStr {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract IbsFields {
    data: IntBoolStr;

    init() {
        self.data = IntBoolStr{
            v1: 42,
            v2: true,
            v3: "yo"
        };
    }
}