struct SOpt {
    a: Int?;
}

contract DefOpt {
    so: SOpt;

    init() {
        self.so = SOpt{ a: null };
    }
}