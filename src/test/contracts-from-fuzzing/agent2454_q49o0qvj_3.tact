struct WithDefaults {
    foo: Int = 7;
    bar: Bool = true;
    text: String = "hello";
    flag: Bool?; // defaults to null implicitly
}

contract DefaultsTest {
    data: WithDefaults;
    
    init() {
        self.data = WithDefaults{};
    }
}