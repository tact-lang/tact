struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Holder {
    nested: WithDefaults;
    s: String?;
}

contract TestContract {
    field: Holder;

    init() {
        self.field = Holder{
            nested: WithDefaults{},
            s: null
        };
    }
}