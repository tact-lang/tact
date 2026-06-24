struct Outer1 {
    a: Int;
    b: String;
}

struct Outer2 {
    x: Bool;
    y: Outer1;
}

contract TestContract {
    prop: Outer2;

    init() {
        self.prop = Outer2{
            x: true,
            y: Outer1{ a: 7, b: "hi" }
        };
    }
}