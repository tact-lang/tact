struct DeeplyNested {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrap1 {
    x: DeeplyNested;
}
struct Wrap2 {
    x: Wrap1;
}
struct Wrap3 {
    x: Wrap2;
}
struct Wrap4 {
    x: Wrap3;
}

contract MuchDepth {
    val: Wrap4;

    init() {
        self.val = Wrap4{ x: Wrap3{ x: Wrap2{ x: Wrap1{ x: DeeplyNested{ a: 1, b: true, c: "hi" } } } } };
    }
}