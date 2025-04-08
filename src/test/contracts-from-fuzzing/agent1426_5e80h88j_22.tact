struct NestedWithNulls {
    i: Int?;
    s: String?;
    b: Bool?;
}

struct Container {
    val1: NestedWithNulls?;
    val2: NestedWithNulls?;
}

contract NestedNullsContract {
    stuff: Container;

    init() {
        self.stuff = Container{
            val1: null,
            val2: NestedWithNulls { i: null, s: "hi", b: null }
        };
    }
}