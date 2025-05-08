struct S {
    x: Int as int64;
    y: Int as uint64;
}

contract IntTypes {
    s: S;

    init() {
        self.s = S{x:123,y:456};
    }
}