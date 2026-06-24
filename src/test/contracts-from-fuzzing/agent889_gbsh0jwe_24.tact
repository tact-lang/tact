struct DeepOptA {
    next: DeepOptB?;
}

struct DeepOptB {
    val: Int;
}

contract DeepOptFieldsInPersistence {
    a: DeepOptA;

    init() {
        self.a = DeepOptA{ next: null };
    }
}