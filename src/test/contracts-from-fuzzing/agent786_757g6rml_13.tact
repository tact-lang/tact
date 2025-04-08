struct ContainsMessage {
    id: Int;
    address: Address;
}

message(0x1111) InnerMsg {
    count: Int;
    name: String;
}

struct TopLevel {
    innerMsg: InnerMsg;
    data: ContainsMessage;
}

contract StructWithMessageField {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            innerMsg: InnerMsg{ count: 7, name: "hi" },
            data: ContainsMessage{ id:1, address: myAddress() }
        };
    }
}