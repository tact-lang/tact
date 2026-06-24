struct Details {
    amount: Int;
}

message(99) Envelope {
    id: Int = 77;
    meta: Details? = null;
}

contract TestMessageOptStruct {
    payload: Envelope;

    init() {
        self.payload = Envelope{
            id: 101,
            meta: Details{ amount: 999 }
        };
    }
}