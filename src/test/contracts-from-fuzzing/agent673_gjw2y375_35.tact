struct Inner {
    x: Int = 10;
    y: Bool = false;
}

struct Outer {
    innerOpt: Inner?;
    name: String;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            innerOpt: null,
            name: "hi"
        };
    }
}