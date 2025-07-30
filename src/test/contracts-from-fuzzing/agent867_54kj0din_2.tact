struct DeepNest {
    inner: Inner;
}

struct Inner {
    innermost: Innermost;
}

struct Innermost {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    data: DeepNest = DeepNest{
        inner: Inner{
            innermost: Innermost{
                x: 1,
                y: true,
                z: "deep"
            }
        }
    };

    init() {
        self.data = DeepNest{
            inner: Inner{
                innermost: Innermost{
                    x: 42,
                    y: false,
                    z: "changed"
                }
            }
        };
    }
}
