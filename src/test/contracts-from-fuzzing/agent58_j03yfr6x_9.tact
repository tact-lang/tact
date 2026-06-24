// Edge test: struct with only optionals
struct Opts {
    a: Int?;
    b: Address?;
    c: Bool?;
}

contract TestContract {
    optData: Opts;

    init() {
        self.optData = Opts{
            a: null,
            b: null,
            c: null
        };
    }
}