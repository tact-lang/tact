struct TupleLike {
    first: Int;
    second: String;
    third: Bool;
}

contract UsesTuple {
    t: TupleLike;

    init() {
        self.t = TupleLike{ first: 123, second: "abc", third: false };
    }
}