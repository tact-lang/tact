struct OptionalNested {
    sub: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract OptNest {
    val: OptionalNested;
    init() {
        self.val = OptionalNested{
            sub: Inner{ x:10, y:"hi" }
        };
    }
}