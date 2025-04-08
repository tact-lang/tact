struct S {
    val: Int = 5;
}

contract InitInitTest {
    data: S;

    init() {
        self.data = S{};
    }
}