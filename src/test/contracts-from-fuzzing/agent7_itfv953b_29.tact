struct OptionalMid {
    first: Int;
    mid: Int?;
    last: String;
}

contract OptMiddle {
    state: OptionalMid;

    init() {
        self.state = OptionalMid{ first: 3, mid: null, last: "hi" };
    }
}