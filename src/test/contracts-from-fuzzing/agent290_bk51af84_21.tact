struct Info {
    count: Int;
    tag: String?;
}

message(123) Payload {
    data: Info;
    remark: String?;
}

contract Test {
    saved: Payload;

    init() {
        self.saved = Payload{
            data: Info{ count: 5, tag: null },
            remark: null
        };
    }
}