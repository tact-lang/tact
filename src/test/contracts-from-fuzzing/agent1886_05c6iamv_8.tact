struct NestedStructOptional {
    s: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
    z: String?;
}

contract TestNestedStructOptional {
    data: NestedStructOptional;

    init() {
        self.data = NestedStructOptional{
            s: Inner{
                x: 10,
                y: true,
                z: null
            }
        };
    }
}