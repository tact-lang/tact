// Same fields in different order to test ordering effects
struct StructOne {
    a: Int;
    b: Bool;
    c: String;
}

struct StructTwo {
    c: String;
    b: Bool;
    a: Int;
}

contract TestContract {
    one: StructOne = StructOne{a: 1, b: true, c: "x"};
    two: StructTwo = StructTwo{c: "y", b: false, a: 2};

    init() {
        self.one = StructOne{a: 3, b: false, c: "z"};
        self.two = StructTwo{c: "w", b: true, a: 4};
    }

    receive() {
        let _ = self.two.a;
    }
}