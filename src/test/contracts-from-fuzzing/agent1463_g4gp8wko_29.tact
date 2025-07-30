struct Nop {
    f: Int = 0;
}

contract OptOptTest {
    f: Nop?;

    init() {
        self.f = null;
    }
}
