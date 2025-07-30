struct NestedDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;
    d: Address;
}

contract DefaultNestedContract {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{ d : myAddress() };
    }
}