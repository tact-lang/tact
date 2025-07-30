struct Foo { a: Int }

contract TestContract {
    val: Foo = Foo{ a: 42 };

    init() {
        // no init needed
    }
}
