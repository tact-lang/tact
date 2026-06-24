struct X { a: Int }

contract DefaultInlineTest {
    prop: X = X{ a: 5 };
    init() {
        self.prop = X{ a: 10 };
    }
}
