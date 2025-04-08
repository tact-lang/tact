struct Foo { a: Int }

contract InnerOptStruct {
    inner: Foo?;

    init() {
        self.inner = Foo{ a: 1 };
    }
}