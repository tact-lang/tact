struct Payload {
    shortStr: String = "a";
    midStr: String = "hello world";
    longStr: String = "this is a very long default string constant to test serialization behavior in contract storage";
}

contract StringsTest {
    payload: Payload = Payload{};

    init() {
        self.payload = Payload{
            shortStr: "x",
            midStr: "updated",
            longStr: "updated long string content"
        };
    }
}