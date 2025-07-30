struct OuterOpt {
    inner: Inner?;
}

struct Inner {
    value: Int = 5;
    flag: Bool = true;
}

contract DoubleOptionals {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: Inner{
                value: 10,
                flag: false
            }
        };
    }
}