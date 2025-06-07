message TestMessage {
    id: Int;
    details: DetailStruct;
}

struct DetailStruct {
    foo: Int;
    optionalText: String?;
    more: MoreDetail;
}

struct MoreDetail {
    active: Bool;
    count: Int;
}

contract TestContract {
    lastMsg: TestMessage;

    init() {
        self.lastMsg = TestMessage{
            id: 1,
            details: DetailStruct{
                foo: 42,
                optionalText: null,
                more: MoreDetail{
                    active: true,
                    count: 123
                }
            }
        };
    }
}
