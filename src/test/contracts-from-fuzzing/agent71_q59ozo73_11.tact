struct OptionalDeepInner {
    a: Int?;
    b: Bool?;
}
struct OptionalMiddle {
    x: OptionalDeepInner?;
}
struct OptionalOuter {
    y: OptionalMiddle?;
}

contract DeepOptionals {
    root: OptionalOuter;

    init() {
        self.root = OptionalOuter{
            y: OptionalMiddle{
                x: OptionalDeepInner{
                    a: null,
                    b: null
                }
            }
        };
    }
}