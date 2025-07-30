struct WithString {
    name: String = "";
    greeting: String = "";
}

contract StringDefaultsTest {
    data: WithString;

    init() {
        self.data = WithString{
            name: "hello",
            greeting: "world"
        };
    }
}