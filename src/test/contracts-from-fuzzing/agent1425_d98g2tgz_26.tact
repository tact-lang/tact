// test nested optional + defaults combo with inner init
struct Inner {
    a: Int = 42;
}

struct Middle {
    inner: Inner?;
}

contract NestedOptDefault {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{}
        };
    }
}