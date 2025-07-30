struct InnerMost {
    z: Int;
}
struct Inner {
    y: InnerMost;
}
struct Mid {
    x: Inner;
}
contract DefaultDeepNest {
    top: Mid = Mid{
        x: Inner{
            y: InnerMost{ z: 42 }
        }
    };
    init() {}
}