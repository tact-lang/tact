struct Foo { a: Int }

contract OptionalStruct {
    val: Foo?;

    init() {
        self.val = Foo{ a: 17 };
    }
}