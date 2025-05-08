struct Wrap {
    inner: Int?;
}

contract OptionalStructInit {
    s: Wrap;

    init() {
        self.s = Wrap{inner:null};
    }
}