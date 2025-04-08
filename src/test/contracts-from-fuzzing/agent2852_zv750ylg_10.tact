struct Defaults {
    i: Int = 1;
    b: Bool = true;
    s: String = "str";
    a: Address;
}

contract DefaultsContract {
    d: Defaults;

    init() {
        self.d = Defaults{ a:myAddress() };
    }
}