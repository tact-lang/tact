message(0xDEADBEEF) Notification {
    code: Int;
}

struct Wrapper {
    note: Notification;
    val: Int;
}

contract WrapperMessagePersist {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            note: Notification{code: 404},
            val: 42,
        };
    }
}