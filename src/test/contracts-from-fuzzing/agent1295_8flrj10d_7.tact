struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: Opts;

    init() {
        self.data = Opts{
            a: null,
            b: null,
            c: null
        };
    }
}