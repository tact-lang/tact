struct StrCombo {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract StrComboContract {
    s: StrCombo;

    init() {
        self.s = StrCombo{
            a:"a",b:"b",c:"c",d:"d"
        };
    }
}