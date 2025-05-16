message(11) Payload { data: Int }

struct PayloadWrapper {
    m: Payload?;
    note: String;
    flag: Bool;
}

contract Test20 {
    storage: PayloadWrapper;

    init() {
        self.storage = PayloadWrapper{
            m: null,
            note: "hello",
            flag: false
        };
    }
}
