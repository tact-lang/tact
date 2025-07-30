struct SOpt {
    s: String?;
}

contract OptStringContract {
    data: SOpt;

    init() {
        self.data = SOpt{ s: null };
    }
}