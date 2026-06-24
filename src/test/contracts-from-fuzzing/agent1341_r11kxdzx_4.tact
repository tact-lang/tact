struct Innermost {
    val: Int;
}

struct Middle {
    inner: Innermost;
}

struct Outer {
    middle: Middle;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Innermost{
                    val: 42
                }
            }
        };
    }
}