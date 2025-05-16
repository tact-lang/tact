// Multiple nested optionals in persistent contract fields
struct Inner {
    v: Int?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    v: null
                }
            }
        };
    }
}