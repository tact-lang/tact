struct DeepDefaults {
    amount: Int = 10;
    flag: Bool = true;
}

struct WithNestedDefaults {
    inner: DeepDefaults = DeepDefaults{};
    note: String = "note";
}

contract NestedDefaultsContract {
    data: WithNestedDefaults;

    init() {
        self.data = WithNestedDefaults{};
    }

    receive() {
        self.data = WithNestedDefaults{
            inner: DeepDefaults{amount: 99, flag: false},
            note: "changed"
        };
    }
}