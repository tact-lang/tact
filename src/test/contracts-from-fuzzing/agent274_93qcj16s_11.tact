struct SingleString {
    s: String;
}

contract LongStringTest {
    data: SingleString;

    init() {
        self.data = SingleString{
            s: "This is a rather long string used to test serialization handling!",
        };
    }
}