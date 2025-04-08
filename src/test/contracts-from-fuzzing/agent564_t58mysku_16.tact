// Struct with optional Booleans and Ints interleaved
struct Opts {
    oi: Int?;
    ob: Bool?;
    ii: Int;
    ib: Bool;
}

contract OptsInterleave {
    data: Opts;

    init() {
        self.data = Opts{
            oi: null,
            ob: null,
            ii: 7,
            ib: true
        };
    }

    receive() {
        if (self.data.oi == null) {
            self.data.ii += 1;
        }
    }
}