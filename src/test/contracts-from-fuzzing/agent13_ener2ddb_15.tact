struct Inner {
    x: Int;
}

struct Outer {
    field: Inner?;
    text: String;
}

contract OptionalStructField2 {
    outer: Outer;

    init() {
        self.outer = Outer{
            field: null,
            text: "testing"
        };
    }
}