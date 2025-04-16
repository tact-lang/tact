struct InnerDefault {
    x: Int = 5;
    y: Bool = true;
}

struct Outer {
    name: String = "default";
    inner: InnerDefault;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: InnerDefault{}
        };
    }
}