struct MiddleSub {
    x: Int;
}

struct TopLevel {
    m: MiddleSub?;
}

contract TestContract {
    dat: TopLevel = TopLevel{ m: null };

    init() {
        self.dat = TopLevel{ m: MiddleSub{ x: 999 } };
    }
}