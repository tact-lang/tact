struct Inner {
    name: String?;
}
struct Outer {
    id: Int;
    details: Inner;
}

contract NestedOptional {
    data: Outer = Outer{
        id: 11,
        details: Inner{ name: null }
    };

    receive() {
        self.data = Outer{
            id: 22,
            details: Inner{ name: "abc" }
        };
    }
}