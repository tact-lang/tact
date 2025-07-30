struct Outmost {
    a: Int;
    b: Middle;
}

struct Middle {
    nested: Inner;
}

struct Inner {
    d: Int;
    s: String;
}

contract DeepNest {
    val: Outmost;

    init() {
        self.val = Outmost{
            a: 1,
            b: Middle{
                nested: Inner{
                    d: 2,
                    s: "str"
                }
            }
        };
    }
}