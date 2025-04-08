struct DefaultsAndOptionals {
    a: Int = 1;
    b: Bool?;
    c: String = "str";
    d: Address?;
}

contract DefOptCombo {
    s: DefaultsAndOptionals;

    init() {
        self.s = DefaultsAndOptionals{b:null,d:null};
    }
}