struct Outer {
    nested: Middle?;
}

struct Middle {
    nested: Inner?;
}

struct Inner {
    val: Int?;
}

contract DeepOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Middle{
                nested: Inner{
                    val: null
                }
            }
        };
    }
}