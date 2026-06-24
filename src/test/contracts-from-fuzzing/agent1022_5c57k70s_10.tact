struct Sub {
    flag: Bool = true;
    note: String = "n";
}

struct Top {
    amount: Int = 1;
    sub: Sub = Sub{};
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{};
    }

    receive() {}
}