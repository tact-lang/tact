struct Reversed {
    a: Int;
    b: Int;
    c: Int;
}

contract ReverseTest {
    data: Reversed;
    init() {
        self.data = Reversed{ c:3, b:2, a:1 };
    }
}