struct DeepNest1 { val1: Int; }

struct DeepNest2 { val2: DeepNest1; }

struct DeepNest3 { val3: DeepNest2; }

contract DeepNestingTest {
    state: DeepNest3;

    init() {
        self.state = DeepNest3{ val3: DeepNest2{ val2: DeepNest1{ val1: 1 } } };
    }
}
