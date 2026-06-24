struct Trailing {
    x: Int;
    y: Int;
    z: Bool;
}

contract CommaTest {
    s: Trailing;

    init() {
        self.s = Trailing{
            x: 1,
            y: 2,
            z: true, // trailing comma as per docs allowed
        };
    }
}
