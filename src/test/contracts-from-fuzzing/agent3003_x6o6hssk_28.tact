struct Opt1 { x: Int?; }
struct Opt2 { x: Opt1?; }
struct Opt3 { x: Opt2?; }

contract DoubleOptionalWrapping {
    foo: Opt3?;

    init() {
        self.foo = null;
    }
}
