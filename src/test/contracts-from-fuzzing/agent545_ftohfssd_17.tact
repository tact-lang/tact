struct Inner1 { x: Int; y: Bool }
struct Inner2 { s: String; z: Int? }
struct Nested {
    in1: Inner1;
    in2: Inner2;
    ready: Bool;
}

contract TestContract {
    val: Nested;

    init() {
        self.val = Nested{
            in1: Inner1{ x: 7, y: true },
            in2: Inner2{ s: "hello", z: null },
            ready: false,
        };
    }

    receive() {}
}