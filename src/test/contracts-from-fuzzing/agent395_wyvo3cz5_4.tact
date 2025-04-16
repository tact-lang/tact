struct WithLongString {
    s: String;
}

contract LongStringField {
    data: WithLongString;
    init() {
        self.data = WithLongString{
            s: "This is a very very very very very very long string just to check serialization behavior."
        };
    }
}
