// deeply nested optionals with integers, serialization specified
struct Leaf {
    x: Int as int64;
}

struct Container {
    leaf: Leaf?;
}

struct OuterContainer {
    container: Container?;
}

contract TestContract {
    field: OuterContainer?;

    init() {
        self.field = OuterContainer{
            container: Container{
                leaf: Leaf{
                    x: -42
                }
            }
        };
    }
}