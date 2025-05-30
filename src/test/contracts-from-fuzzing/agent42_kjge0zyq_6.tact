struct Inner {
    z: String;
}
struct Middle {
    inner: Inner;
}
struct Outer {
    middle: Middle;
}

contract NestedAssign {
    data: Outer?;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    z: "hello"
                }
            }
        };
    }
}