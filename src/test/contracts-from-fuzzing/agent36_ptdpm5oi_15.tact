struct Tricky {
    a: Int?;
    b: String?;
}

contract OuterOptInnerNulls {
    tricky: Tricky?;

    init() {
        self.tricky = Tricky{ a: null, b: null };
    }

    receive() {
        let _ = self.tricky;
    }
}