struct InnerMost {
    a: Int?;
    b: Bool;
}

struct Middle {
    val: Int;
    next: InnerMost?;
}

struct Outer {
    wrapper: Middle?;
}

contract ManyOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            wrapper: Middle{
                val: 11,
                next: InnerMost{
                    a: null,
                    b: false
                }
            }
        };
    }
}