struct Inner {
    a: Int = 5;
    b: Bool = true;
}

struct Outer {
    x: Inner;
    y: String = "default";
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{ x: Inner{}, y: "set" };
    }
}