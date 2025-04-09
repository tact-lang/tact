struct Innermost1 {
    val: Int;
}

struct Inner1 {
    im1: Innermost1;
    opt: Bool?;
}

struct Outer1 {
    in1: Inner1;
    data: String;
}

contract NestedLayers {
    state: Outer1;

    init() {
        self.state = Outer1{
            in1: Inner1{
                im1: Innermost1{val: 4242},
                opt: true,
            },
            data: "deep layers",
        };
    }
}