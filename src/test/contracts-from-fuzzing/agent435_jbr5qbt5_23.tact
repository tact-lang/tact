// Struct combining multiple optional bools and ints
struct Opts {
    a: Bool?;
    b: Int?;
    c: Bool?;
    d: Int?;
}

contract TestContract {
    combo: Opts;

    init() {
        self.combo = Opts{
            a: null,
            b: 42,
            c: true,
            d: null,
        };
    }
}
