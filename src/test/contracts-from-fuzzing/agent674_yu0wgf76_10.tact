struct Outer {
    mid: Middle;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    number: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    flag: true,
                    number: null,
                }
            }
        };
    }
}