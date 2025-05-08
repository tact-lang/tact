// Testing optional struct type used directly
struct Foo { x: Int; }

contract UseOptionalNested {
    opt: Foo?;

    init() {
        self.opt = null;
    }
}
