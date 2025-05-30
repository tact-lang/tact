struct AllOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: AllOpt;

    init() {
        self.data = AllOpt{};
    }

    receive() {
        let _ = self.data.a;
    }
}