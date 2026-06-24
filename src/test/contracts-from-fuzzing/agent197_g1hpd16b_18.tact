struct Nested { x: Int = 1; y: Int = 2; }

contract InitFuzzer {
    content: Nested;

    init() {
        self.content = Nested{ x: 42, y: 2 };
    }
}