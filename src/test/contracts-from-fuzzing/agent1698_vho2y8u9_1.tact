struct Inner {
    z: Int;
    t: Bool;
}

contract NestedSingleField {
    nf: Inner;

    init() {
        self.nf = Inner{z: 5, t: true};
    }
}