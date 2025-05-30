struct Foo { a: Int }

contract OptionalStructTest {
    data: Foo?;

    init() {
        self.data = Foo{ a: 55 };
    }
}