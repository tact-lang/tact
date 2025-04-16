// optional struct with some fields default and some explicit null
struct Foo {
    x: Int? = 7;
    y: String?;
}

contract TestContract {
    f: Foo;

    init() {
        self.f = Foo{ y:null };
    }
}
