// struct w/ many optional nested inside another optional
struct Inner {
    x: Int?;
    y: String?;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract ComplexOpt {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 123,
                y: "hi"
            },
            flag: false
        };
    }
}