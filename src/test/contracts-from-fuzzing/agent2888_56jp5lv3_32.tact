// Optional bool chain 3x deep
struct X1 { b: Bool?; }
struct X2 { x1: X1?; }
struct X3 { x2: X2?; }

contract OptBoolChain {
    store: X3;

    init() {
        self.store = X3{ x2: null };
    }
}