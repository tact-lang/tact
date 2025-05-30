struct Rec1 {
    inner: Int;
    next: Rec2;
}

struct Rec2 {
    val: Int;
    last: Bool;
}

contract MultiRecTest {
    state: Rec1;

    init() {
        self.state = Rec1 {
            inner: 1,
            next: Rec2 { val: 2, last: true }
        };
    }
}
