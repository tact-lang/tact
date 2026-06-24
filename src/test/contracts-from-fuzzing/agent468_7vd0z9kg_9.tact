// Struct with nested struct and optionals combined
struct Small {
    id: Int;
    label: String?;
}

struct Big {
    left: Small;
    right: Small?;
    flag: Bool;
    note: String;
}

contract NestedCombo {
    data: Big;

    init() {
        self.data = Big{
            left: Small{ id:1, label:null },
            right: null,
            flag: true,
            note: "done"
        };
    }
}