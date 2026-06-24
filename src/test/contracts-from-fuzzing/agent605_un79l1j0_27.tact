struct WithZeroes {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract Zeros {
    f: WithZeroes;

    init() {
        self.f = WithZeroes{};
    }
}