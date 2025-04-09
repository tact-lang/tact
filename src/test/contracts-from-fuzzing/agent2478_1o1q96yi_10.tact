struct Nested1 { x: Int }
struct Nested2 { n1: Nested1 }
struct Nested3 { n2: Nested2 }
struct Nested4 { n3: Nested3 }

contract DeeplyNested4 {
    storage: Nested4;
    init() {
        self.storage = Nested4{ n3: Nested3{ n2: Nested2{ n1: Nested1{ x: 99 } } } };
    }
}