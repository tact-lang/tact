struct L1 {
    x: Int;
    y: Bool;
}

struct L2 {
    x: L1?;
    y: Bool;
}

struct L3 {
    x: L2?;
    y: String;
}

contract TestContract {
    nested: L3;

    init() {
        self.nested = L3{
            x: null,
            y: "hello"
        };
    }
}