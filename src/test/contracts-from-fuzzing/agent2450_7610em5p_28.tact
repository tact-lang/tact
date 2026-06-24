// Edge case: contract persistent state with *nested optionals inside optional* inside optional
struct Inner {
    x: Int?;
}

struct Middle {
    y: Inner?;
}

contract CrazyNestedOptionals {
    z: Middle?;

    init() {
        self.z = Middle{ y: null };
    }
}
