struct Opts {
    optionalCount: Int?;
    optionalText: String?;
}

contract OptsTest {
    data: Opts;
    init() {
        self.data = Opts{ optionalCount: null, optionalText: null };
    }
}