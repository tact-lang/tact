struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hey";
    d: Int? = null;
}

contract TestContract {
    config: Defaulted;

    init() {
        self.config = Defaulted{};
    }

    receive() {
        self.config = Defaulted{ a: 10, b: false, c: "hi", d: 7 };
    }
}