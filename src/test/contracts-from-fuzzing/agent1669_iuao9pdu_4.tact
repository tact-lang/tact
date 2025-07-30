struct Inner {
    val: Int?;
    flag: Bool;
}

struct Middle {
    inner: Inner?;
    msg: String?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    nestedOptionals: Outer;

    init() {
        self.nestedOptionals = Outer{
            middle: Middle{
                inner: Inner{
                    val: 123,
                    flag: false
                },
                msg: "hello"
            }
        };
    }
}
