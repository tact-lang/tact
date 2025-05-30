message E {}

struct SemiEmpty {
    e: E;
}

contract SemiEmptyTest {
    s: SemiEmpty;

    init() {
        self.s = SemiEmpty{ e: E{} };
    }
}