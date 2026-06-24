struct DeepNestCombo {
    a: Sub1?;
}

struct Sub1 {
    b: Sub2?;
}

struct Sub2 {
    c: Bool?;
}

contract DeepNestComboContract {
    storage: DeepNestCombo;

    init() {
        self.storage = DeepNestCombo { a: null };
    }
}