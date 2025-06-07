struct WithLongStringField {
    text: String;
}

contract LongStringFieldTest {
    data: WithLongStringField;

    init() {
        self.data = WithLongStringField{
            text: "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        };
    }
}