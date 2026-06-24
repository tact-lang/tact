struct Toplevel {
    inner: MiddleLayer;
}

struct MiddleLayer {
    nested: DeepestLayer;
}

struct DeepestLayer {
    x: Int;
    y: Bool;
    z: String;
}

contract InheritDeep {
    data: Toplevel;

    init() {
        self.data = Toplevel{
            inner: MiddleLayer{
                nested: DeepestLayer{
                    x: 7,
                    y: true,
                    z: "deep",
                },
            },
        };
    }
}
