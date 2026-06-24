struct Innermost {
    num: Int;
    status: Bool;
}

struct Middle {
    inner: Innermost;
    msg: String;
}

struct Outer {
    mid1: Middle?;
    mid2: Middle?;
    text: String?;
    number: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid1: null,
            mid2: null,
            text: null,
            number: null,
        };
    }
}
