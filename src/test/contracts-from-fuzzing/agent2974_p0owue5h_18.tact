// Message struct with defaulted optional embedded as storage
message(101) Foo {
    a: Int = 10;
    b: Bool?;
}

contract TestContract {
    msg: Foo;

    init() {
        self.msg = Foo{ b: null };
    }
}