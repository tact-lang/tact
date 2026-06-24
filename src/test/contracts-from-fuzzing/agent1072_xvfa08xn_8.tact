struct X1 { a: Int }
struct X2 { b: X1 }
struct X3 { c: X2 }
struct X4 { d: X3 }
struct X5 { e: X4 }

contract FiveLayers {
    nested: X5;
    init() {
        self.nested = X5{ e: X4{ d: X3{ c: X2{ b: X1{ a: 123 }}}}};
    }
}