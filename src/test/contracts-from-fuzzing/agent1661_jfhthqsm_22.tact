struct Foo { a: Int }

contract OptStore {
    f: Foo?;

    init() {
        self.f = Foo{a:123};
    }
}