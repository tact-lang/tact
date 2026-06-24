struct InnerDefaults {
    enabled: Bool? = true;
    count: Int? = null;
    label: String? = "default";
}

struct Outer {
    id: Int;
    state: InnerDefaults;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            id: 100,
            state: InnerDefaults{}
        };
    }
}