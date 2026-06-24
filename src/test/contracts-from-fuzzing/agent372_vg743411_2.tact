struct Inner {
    z: String;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract Test {
    myfield: Outer;
    init() {
        self.myfield = Outer{
            x: 1,
            y: Inner{
                z: ""
            }
        };
    }
}