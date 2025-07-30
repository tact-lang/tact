struct Inner {
    s: String;
    i: Int;
}

struct Outer {
    o: Inner?;
    flag: Bool;
}

contract OptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            o: Inner{
                s: "hello",
                i: 123
            },
            flag: true
        };
    }
}
