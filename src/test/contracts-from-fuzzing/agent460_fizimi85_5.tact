struct Inner {
    val: Int;
}

struct Middle {
    info: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract OptionalNestedStruct {
    storage: Outer?;

    init() {
        self.storage = Outer{
            mid: Middle{
                info: Inner{
                    val: 100,
                }
            }
        };
    }
}