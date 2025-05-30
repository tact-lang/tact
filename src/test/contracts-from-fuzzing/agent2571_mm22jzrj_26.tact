struct Inner {
    num: Int;
}

struct Mid {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Mid;
    comment: String;
}

contract Layered {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: Inner{
                    num: 5
                },
                flag: true
            },
            comment: "hi"
        };
    }
}
