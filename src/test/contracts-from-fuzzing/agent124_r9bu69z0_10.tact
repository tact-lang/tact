struct S1 {
    intField: Int;
    strField: String;
    boolField: Bool;
}

contract MixedTypes {
    val: S1;

    init() {
        self.val = S1{ intField: 1, strField: "x", boolField: true };
    }
}