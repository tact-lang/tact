struct Nested {
    x: Int;
    y: Bool?;
    s: String;
}

contract TestContract {
    data: Nested = Nested{ x: 3, y: true, s: "ok" };

    init() {
        self.data = Nested{ x: 5, y: null, s: "change" };
    }
}