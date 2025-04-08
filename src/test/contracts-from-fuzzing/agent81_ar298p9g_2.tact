struct DeepNest { val: Int; }

struct MidNest { deep: DeepNest; }

struct TopNest { mid: MidNest; }

contract TestContract {
    nested: TopNest;

    init() {
        self.nested = TopNest{ mid: MidNest{ deep: DeepNest{ val: 123 } } };
    }
}