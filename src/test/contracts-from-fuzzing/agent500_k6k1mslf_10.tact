struct Boo {
    ok: Bool = true;
    data: Int = 7;
}

contract DefaultsTest {
    field: Boo;

    init() {
        self.field = Boo{};
    }
}