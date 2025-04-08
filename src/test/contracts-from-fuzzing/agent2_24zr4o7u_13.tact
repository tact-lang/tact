struct Inner {
    flag: Bool?;
    number: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract DeepOptionals {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                inner: Inner{
                    flag: true,
                    number: 123
                }
            }
        };
    }
}