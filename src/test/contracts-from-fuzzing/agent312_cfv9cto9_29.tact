struct Nested {
    a: Int = 42;
    b: Bool = true;
}

struct Outer {
    note: String;
    nest: Nested;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            note: "msg",
            nest: Nested{}
        };
    }
}