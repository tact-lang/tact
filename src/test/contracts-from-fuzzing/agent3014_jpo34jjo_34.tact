// A chain, where inner fields mix defaults and optional nested structs
struct Inner {
    x: Int;
    y: Bool = false;
    z: String?;
}

struct Outer {
    nest: Inner?;
}

contract MixDefaultOpt {
    val: Outer;
    init() {
        self.val = Outer{
            nest: null
        };
    }
}