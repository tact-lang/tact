struct OptionalInner {
    val: Int?;
}

struct WrapperStruct {
    inner: OptionalInner;
    flag: Bool;
    count: Int?;
}

contract OptionalStructTest {
    data: WrapperStruct = WrapperStruct{
        inner: OptionalInner{ val: null },
        flag: false,
        count: null,
    };

    init() {
        self.data = WrapperStruct{
            inner: OptionalInner{ val: 123 },
            flag: true,
            count: 5,
        };
    }

    receive() {
        self.data = self.data;
    }
}