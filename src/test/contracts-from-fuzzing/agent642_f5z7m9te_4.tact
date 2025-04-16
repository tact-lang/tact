struct DeepNested3 { c: Int }
struct DeepNested2 { b: DeepNested3 }
struct DeepNested1 { a: DeepNested2 }

contract TestContract {
    val: DeepNested1;

    init() {
        self.val = DeepNested1{ a: DeepNested2{ b: DeepNested3{ c: 42 } } };
    }
}