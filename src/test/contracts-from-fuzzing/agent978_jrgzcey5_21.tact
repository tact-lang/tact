// struct with a large mix of optional and primitive fields with default values for some fields
struct WithDefaults {
    a: Int = 5;
    b: Bool;
    c: Int?;
    d: String = "hi";
    e: Address;
    f: Bool?;
    g: String?;
}

contract DefaultsContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{
            // a omitted (uses default)
            b: true,
            c: null,
            // d omitted (uses default)
            e: myAddress(),
            f: null,
            g: null
        };
    }
}