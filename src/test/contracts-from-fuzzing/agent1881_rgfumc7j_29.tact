struct HasNestedMessages {
    m1: M1;
    m2: M2;
}

message M1 {}
message M2 {}

contract NestedMsgs {
    field: HasNestedMessages;

    init() {
        self.field = HasNestedMessages{ m1: M1{}, m2: M2{} };
    }
}