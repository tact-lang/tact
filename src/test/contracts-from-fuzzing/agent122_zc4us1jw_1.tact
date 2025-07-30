struct DeepNested { n: Nested; }
struct Nested { i: Int; b: Bool; }

contract TestContract {
    obj: DeepNested;

    init() {
        self.obj = DeepNested{ n: Nested{ i: 5, b: true } };
    }
}