// Test optional field default is null
struct OptDefaults {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    opt: OptDefaults;

    init() {
        self.opt = OptDefaults{
            a: null,
            b: null
        };
    }
}