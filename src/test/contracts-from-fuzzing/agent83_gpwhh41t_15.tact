struct Outer {
    inner: InnerOption?;
}

struct InnerOption {
    flag: Bool;
    text: String;
}

contract OptNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: InnerOption{
                flag: true,
                text: "test"
            }
        };
    }
}
