// optional struct containing optional primitives
struct Sub {
    s: String?;
    c: Cell?;
}

contract OptStructPrimitives {
    data: Sub?;
    init() {
        self.data = null;
    }
}