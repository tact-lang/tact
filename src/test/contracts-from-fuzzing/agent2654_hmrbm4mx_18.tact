struct InnerA { x: Int; }
struct InnerB { y: String; }

struct WithOptionals {
    a: InnerA?;
    b: InnerB?;
}

contract OptionalStructFields {
    w: WithOptionals;

    init() {
        self.w = WithOptionals{
            a: null,
            b: null
        };
    }
}