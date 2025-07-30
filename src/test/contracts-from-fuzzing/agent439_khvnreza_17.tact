struct SOpt {
    n: Int?;
    b: Bool?;
    s: String?;
}

contract Test17 {
    sopt1: SOpt;
    sopt2: SOpt;

    init() {
        self.sopt1 = SOpt{n: null, b: null, s: null};
        self.sopt2 = SOpt{n: null, b: null, s: null};
    }

    receive() {}
}