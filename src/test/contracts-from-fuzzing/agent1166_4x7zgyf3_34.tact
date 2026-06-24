// Optional chain with inner defaults should still be nullable
struct DA { v: Int=2; }
struct DB { d: DA?; }
struct DC { d: DB?; }

contract OptDefaultsChain {
    v: DC;
    init() {
        self.v = DC{
            d: null
        };
    }
}
