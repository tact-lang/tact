struct OptionalRec {
    s: SubRec?;
}

struct SubRec {
    x: Int?;
}

contract OptionalRecContract {
    r: OptionalRec;

    init() {
        self.r = OptionalRec { s: null };
    }
}