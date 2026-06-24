struct Inner {
    val: Int;
}
struct Outer {
    one: Inner;
    two: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            one: Inner{val:1},
            two: Inner{val:2}
        };
    }
}