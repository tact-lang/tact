struct SubInner {
    z: Int;
}

struct Inner {
    y: SubInner;
}

struct Outer {
    x: Inner;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{
                y: SubInner{
                    z: 42
                }
            }
        };
    }
}