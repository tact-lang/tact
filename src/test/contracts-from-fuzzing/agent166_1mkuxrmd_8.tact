struct Innermost {
    data: String?;
}

struct Middle {
    inner: Innermost;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    num: Int;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer{
            mid: Middle{
                inner: Innermost{
                    data: null,
                },
                flag: false,
            },
            num: 7,
        };
    }
}