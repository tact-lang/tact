message(1) M1 { a: Int }
message(2) M2 { b: Bool }

struct OptionalMessages {
    m1: M1?;
    m2: M2?;
}

contract OptionalMsgStorage {
    data: OptionalMessages = OptionalMessages{
        m1: null,
        m2: null
    };

    init() {
        self.data = OptionalMessages{
            m1: M1{ a: 123 },
            m2: M2{ b: true }
        };
    }
}