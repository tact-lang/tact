// struct with default values for nested fields
struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract DefNested {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}