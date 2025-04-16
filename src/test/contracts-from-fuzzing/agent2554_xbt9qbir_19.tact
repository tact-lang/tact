struct Innermost { v: Int; }

struct HasDefaultOpt {
    val: Int = 1;
    inner: Innermost? = null;
}

contract OptDefaultStruct {
    s: HasDefaultOpt;

    init() {
        self.s = HasDefaultOpt{
            val: 10
            // omit inner, should default null
        };
    }
}