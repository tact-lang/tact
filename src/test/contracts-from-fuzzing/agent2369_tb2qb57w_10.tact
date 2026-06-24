// deeply nested optional fields inside nested structs
struct Outer {
    a: Mid?;
}

struct Mid {
    b: Inner?;
}

struct Inner {
    c: Int?;
}

contract NestedOpt {
    val: Outer;

    init() {
        self.val = Outer{
            a: Mid{
                b: Inner{
                    c: null
                }
            }
        };
    }
}