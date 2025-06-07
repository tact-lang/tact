// struct with lots of optional fields defaulting to null
struct OptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptDefaultsContract {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}