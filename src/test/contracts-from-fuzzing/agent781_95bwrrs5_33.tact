struct Opts {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    val: Opts;

    init() {
        self.val = Opts{};
    }
}