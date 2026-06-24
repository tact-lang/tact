// Test serialization edge case: deeply layered optional nested structs
struct Leaf {
    x: Int;
}

struct Nested1 {
    next: Leaf?;
}

struct Nested2 {
    next: Nested1?;
}

struct Nested3 {
    next: Nested2?;
}

struct Nested4 {
    next: Nested3?;
}

contract TestContract {
    data: Nested4;

    init() {
        self.data = Nested4{
            next: Nested3{
                next: Nested2{
                    next: Nested1{
                        next: Leaf{
                            x: 42
                        }
                    }
                }
            }
        };
    }
}