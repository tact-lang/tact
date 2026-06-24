struct HasDefaults {
    foo: Int = 0;
    bar: Bool = false;
    name: String = "";
    opt: Int?;  
}

contract DefaultsTest {
    state: HasDefaults;

    init() {
        self.state = HasDefaults{
            opt: null
        };
    }
}
