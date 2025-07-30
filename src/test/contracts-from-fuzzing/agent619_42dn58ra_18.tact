struct Nested1 { a: Int; }
struct Nested2 { nested: Nested1; } 
struct Nested3 { nested: Nested2; } 
struct Nested4 { nested: Nested3; }
struct Nested5 { nested: Nested4; }

contract Chain5 {
    val: Nested5;

    init() {
        self.val = Nested5{ nested: Nested4{ nested: Nested3{ nested: Nested2{ nested: Nested1{ a: 5 } } } } };
    }
}