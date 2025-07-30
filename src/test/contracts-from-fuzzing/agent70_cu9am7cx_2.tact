struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    val: Inner?;
}

struct Outer {
    data: Middle?;
}

contract DeepOptional {
    nested: Outer;

    init() {
        self.nested = Outer{
            data: Middle{
                val: Inner{
                    a: 42,
                    b: null
                }
            }
        };
    }
}
