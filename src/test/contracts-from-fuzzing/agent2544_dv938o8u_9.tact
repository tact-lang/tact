struct InnerMost {
    flag: Bool;
    note: String;
}

struct Middle {
    inner: InnerMost?;
    count: Int;
}

struct Outer {
    mid: Middle?;
    label: String;
}

contract DeepOptional {
    data: Outer;
    init() {
        self.data = Outer{
            mid: Middle{
                inner: null,
                count: 50
            },
            label: "hello"
        };
    }
}