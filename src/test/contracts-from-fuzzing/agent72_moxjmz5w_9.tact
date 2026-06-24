struct OptMid {
    sub: Int?;
}

struct Top2 {
    mid: OptMid?;
    flag: Bool;
}

contract OptionalNest {
    vals: Top2;

    init() {
        self.vals = Top2{ mid: null, flag: true };
    }
}