struct OptionalNest {
    val1: Int?;
    val2: Int?;
    nest: Inner?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract OptNested {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val1: null,
            val2: 20,
            nest: Inner{x:1,y:2}
        };
    }
}
