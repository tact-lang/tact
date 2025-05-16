struct Child { x: Int = 5; }
struct Parent { c: Child?; }

contract NullNested {
    p: Parent;

    init() {
        self.p = Parent{
            c: null
        };
    }
    receive() {}
}