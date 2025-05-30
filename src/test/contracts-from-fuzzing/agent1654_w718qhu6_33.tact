struct OptionalWide {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyNullStates {
    val: OptionalWide?;

    init() {
        self.val = null;
    }
}