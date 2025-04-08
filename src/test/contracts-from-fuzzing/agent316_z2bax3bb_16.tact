struct Nested {
    x: String;
    y: Int;
}

struct Holder {
    n: Nested;
}

contract Test {
    data: Holder;

    init() {
        self.data = Holder{
            n: Nested{
                x: "nested",
                y: 100
            }
        };
    }
}
