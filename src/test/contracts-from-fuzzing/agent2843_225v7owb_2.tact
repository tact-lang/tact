struct Inner {
    x: Int;
    y: Int;
    flag: Bool;
}

contract Test2 {
    pos: Inner;

    init() {
        self.pos = Inner{
            x: 1,
            y: 2,
            flag: true,
        };
    }
}