struct AltInner1 { x: Int }
struct AltInner2 { y: Bool }

struct OuterOpt {
    f1: AltInner1?;
    f2: AltInner2?;
    f3: Int?;
    f4: Bool?;
}

contract NestedOptionals {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            f1: null,
            f2: null,
            f3: null,
            f4: null
        };
    }
}