// chain of struct with optionals on different levels
struct Three {
    a: Int;
}

struct Two {
    three: Three?;
    b: Bool;
}

struct One {
    two: Two?;
    s: String;
}

contract MultiOption {
    data: One;

    init() {
        self.data = One{
            two: null,
            s: "x"
        };
    }
}