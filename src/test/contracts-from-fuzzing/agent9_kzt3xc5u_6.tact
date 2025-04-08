struct Nested1 { a: Int; }
struct Nested2 { b: Nested1; }
struct Nested3 { c: Nested2; }
struct Nested4 { d: Nested3; }
struct Nested5 { e: Nested4; }

contract DeepChainNested {
    val: Nested5;

    init() {
        self.val = Nested5{ e: Nested4{ d: Nested3{ c: Nested2{ b: Nested1{ a: 99 } } } } };
    }
}