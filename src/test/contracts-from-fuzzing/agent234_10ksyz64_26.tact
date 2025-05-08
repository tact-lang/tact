struct WithLongString {
    message: String;
}

contract LongStringTest {
    data: WithLongString;

    init() {
        self.data = WithLongString{
            message: "This is a longer string with symbols & numbers 12345!"
        };
    }
}