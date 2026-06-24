struct NestedInner {
    x: Int;
    y: Bool;
}

struct Outer {
    inn: NestedInner;
    name: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inn: NestedInner{
                x: 5,
                y: true,
            },
            name: "Outer",
        };
    }
}