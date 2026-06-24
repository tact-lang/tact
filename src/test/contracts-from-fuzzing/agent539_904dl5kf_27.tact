struct Annotated {
    a: Int as uint64;
    b: Int as int128;
    s: String;
}

contract TestContract {
    val: Annotated;
    init() {
        self.val = Annotated{
            a: 1,
            b: -1,
            s: "foo"
        };
    }
}