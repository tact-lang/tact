// Test order dependence of nested optionals with defaults
struct Foo {
    a: Int?;
    b: Int? = 5;
    c: Int;
}

contract TestContract {
    f: Foo;

    init() {
        self.f = Foo{ a:null, c:10 };
    }
}