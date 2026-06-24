struct Inner {
    data: String;
}

struct Mid {
    inner: Inner;
    data: String;
}

struct Outer {
    mid: Mid;
    data: String;
}

contract TestContract {
    nestedStrings: Outer;

    init() {
        self.nestedStrings = Outer{
            data: "outer",
            mid: Mid{
                data: "mid",
                inner: Inner{
                    data: "inner"
                }
            }
        };
    }
}