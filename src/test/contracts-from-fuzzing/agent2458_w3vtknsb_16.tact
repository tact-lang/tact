// Test nested struct with mix of optional optionals
struct Inner {
    level: Int?;
    note: String?;
}

struct Outer {
    innerOpt: Inner?;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: Inner{
                level: null,
                note: null
            },
            label: "abc"
        };
    }
}