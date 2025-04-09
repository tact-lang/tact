struct Inner {
    one: Int;
    text: String;
}

struct Outer {
    two: Bool;
    inside: Inner;
}

contract NestedReassign {
    data: Outer;

    init() {
        self.data = Outer{
            two: true,
            inside: Inner{ one: 7, text: "abc" }
        };
        self.data = self.data;
    }
}