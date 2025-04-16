struct Inner {
    s: String;
    f: Bool;
}

struct Mid {
    inn1: Inner;
    inn2: Inner?;
}

contract NestedStructOpts {
    val: Mid?;

    init() {
        self.val = Mid{
            inn1: Inner{s:"hello", f:true},
            inn2: null
        };
    }
}