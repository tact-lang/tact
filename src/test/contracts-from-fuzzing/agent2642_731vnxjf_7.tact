struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    val: Opts;
    init() {
        self.val = Opts{ a: null, b: null, c: null };
    }
}