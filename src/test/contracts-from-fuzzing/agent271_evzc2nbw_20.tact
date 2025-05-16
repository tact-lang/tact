struct Rec1 {
    val: Int;
    r2: Rec2;
}

struct Rec2 {
    val: Int;
    r3: Rec3;
}

struct Rec3 {
    val: Int;
}

contract ChainStructsTest {
    data: Rec1;

    init() {
        self.data = Rec1{ val:1, r2: Rec2{ val:2, r3: Rec3{ val:3 } } };
    }
}
