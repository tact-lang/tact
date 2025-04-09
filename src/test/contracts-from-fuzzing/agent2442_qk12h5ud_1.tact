struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }

contract DeepNested {
    nested: Inner1;
    nested2: Inner2;
    init() {
        self.nested = Inner1{ a: 5 };
        self.nested2 = Inner2{ b: true };
    }
}