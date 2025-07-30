struct OptionalStruct {
    msg: String?;
    info: Cell?;
}

struct Wrapper {
    inner: OptionalStruct;
    count: Int = 5;
}

contract OptStructInStruct {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            inner: OptionalStruct{
                msg: null,
                info: null,
            },
            count: 5,
        };
    }

    receive() {}
}