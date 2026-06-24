message(0x123) SomeMsg {
    val: Int;
}

struct Wrapper {
    msg: SomeMsg?;
    num: Int;
}

contract TestContract {
    wrapper: Wrapper;

    init() {
        self.wrapper = Wrapper{
            msg: null,
            num: 77
        };
    }
}