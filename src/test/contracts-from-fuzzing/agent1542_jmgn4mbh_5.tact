struct Foo {
    m: Int;
    s: String;
}

contract Test {
    opt: Foo?;

    init() {
        self.opt = Foo{ m: 10, s: "hi" };
    }
}