struct SOpt {
    inner: Int?;
}

contract OptStructAsField {
    s: SOpt;

    init() {
        self.s = SOpt{ inner: null };
    }

    receive() {
        let z = self.s;
    }
}