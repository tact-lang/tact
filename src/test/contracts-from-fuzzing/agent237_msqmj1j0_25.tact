struct Combo {
    i: Int;
    s: String;
    a: Address;
}

struct ComboOpt {
    inner: Combo?;
    flag: Bool;
}

contract NestedComboOpt {
    c: ComboOpt;
    init() {
        self.c = ComboOpt{
            inner: null,
            flag: true
        };
    }
}