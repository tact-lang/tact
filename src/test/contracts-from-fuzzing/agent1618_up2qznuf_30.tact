struct CrazyCombo {
    s: String = "abc";
    n: Int? = null;
    a: Address;
    b: Bool;
}

contract ComboContract {
    info: CrazyCombo;

    init() {
        self.info = CrazyCombo{
            a: myAddress(),
            b: true
        };
    }
}