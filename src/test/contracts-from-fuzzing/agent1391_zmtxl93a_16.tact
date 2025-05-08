struct Inner {
    flag: Bool?;
}

struct Outer {
    nested: Inner;
}

contract OuterWithOptional {
    val: Outer = Outer{
        nested: Inner{
            flag: null
        }
    };
}