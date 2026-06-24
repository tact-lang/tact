struct TailRemains {
    head: Int;
    body: Bool;
    tail: Slice as remaining;
}

contract TailRemTest {
    f: TailRemains;

    init() {
        self.f = TailRemains{
            head: 1,
            body: false,
            tail: emptyCell().asSlice()
        };
    }
}