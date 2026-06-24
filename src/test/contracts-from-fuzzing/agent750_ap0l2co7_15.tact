struct WrapBool {
    x: Bool;
}

struct OutOpt {
    wrap: WrapBool?;
}

contract OptionalStructWrapper {
    outer: OutOpt;
    init() {
        self.outer = OutOpt{wrap: WrapBool{x:true}};
    }
}