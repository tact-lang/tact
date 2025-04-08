// optional struct stored with default values
struct Foo {
    a: Int?;
    b: String?;
}

contract Test {
    val: Foo?;

    init() {
        self.val = Foo{ a: null, b: null };
    }
}