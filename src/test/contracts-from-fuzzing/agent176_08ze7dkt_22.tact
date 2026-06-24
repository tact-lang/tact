struct RecA { val: Int }
struct RecB { inner: RecA? }

contract OptionalRecursion {
    value: RecB?;
    init() {
        self.value = RecB{ inner: null };
    }
}