struct DeepOptional {
    inner: Int?;
}

struct Mid {
    deep: DeepOptional?;
}

contract OptNestTest {
    store: Mid;
    init() {
        self.store = Mid{ deep: null };
    }
}