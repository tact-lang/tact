// optional entire struct type
struct Foo { x: Int }

contract Test {
    s: Foo?;
    init() {
        self.s = null;
    }
}