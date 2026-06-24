struct Rec1 {
    s: Rec2?;
}

struct Rec2 {
    k: Rec3?;
}

struct Rec3 {
    v: Int;
}

contract ChainOptionalsTest {
    data: Rec1;

    init() {
        self.data = Rec1{ s: null };
    }
}