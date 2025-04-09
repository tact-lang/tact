struct WithLongString {
    s: String;
}

contract LongStringTest {
    val: WithLongString;

    init() {
        self.val = WithLongString{s: "This is a very very very very very very very long string."};
    }
}
