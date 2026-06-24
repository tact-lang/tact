contract BounceTest {
    intValue: Int;

    init() {
        self.intValue = 0;
    }

    // bounced receiver handling a typed bounced message MyBouncedMsg
    bounced(msg: bounced<MyBouncedMsg>) {
        self.intValue = 42;
    }
}

message MyBouncedMsg {
    dummy: Int;
}
