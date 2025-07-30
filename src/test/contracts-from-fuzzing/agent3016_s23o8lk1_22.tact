struct StructWithStrings {
    x: String;
    y: String;
    z: String?;
}

contract TestContract {
    s: StructWithStrings;

    init() {
        self.s = StructWithStrings{
            x: "x",
            y: "y",
            z: null
        };
    }
}