// nested optional with optional struct field inside optional struct
struct Inner {
    val: Int?;
}

struct Outer {
    nested: Inner?;
}

contract OptInOpt {
    f: Outer?;

    init() {
        self.f = Outer{
            nested: Inner{
                val: null
            }
        };
    }
}