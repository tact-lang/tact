struct Opts {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract TestContract {
    data: Opts;

    init() {
        self.data = Opts{};
    }

    receive() {
        let _ = self.data;
    }
}