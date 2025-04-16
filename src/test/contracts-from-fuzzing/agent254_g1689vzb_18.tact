struct IntStringBool {
    i: Int;
    s: String;
    b: Bool;
}

contract MixedTypesContract {
    data: IntStringBool;

    init() {
        self.data = IntStringBool{
            i: 7,
            s: "mix",
            b: true
        };
    }
}