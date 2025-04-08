struct DefaultsAll {
    i: Int = 5;
    b: Bool = false;
    s: String = "s";
}

contract DefaultsNestedOverride {
    val: DefaultsAll;

    init() {
        self.val = DefaultsAll{ i: 10, b: true, s: "new" };
    }
}