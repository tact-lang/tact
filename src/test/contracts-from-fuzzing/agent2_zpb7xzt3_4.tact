struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    flag: Bool;
    nested: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            flag: true,
            nested: Inner{
                x: 123,
                y: "hi"
            }
        };
    }
}