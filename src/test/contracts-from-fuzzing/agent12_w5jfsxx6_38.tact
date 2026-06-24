message(77) LMsg {
    v: Int = 7;
}

struct Inner {
    lm: LMsg?;
}

struct Outer {
    inr: Inner?;
}

contract OverrideDeepOptional {
    o: Outer = Outer{
        inr: Inner{
            lm: null
        }
    };
}