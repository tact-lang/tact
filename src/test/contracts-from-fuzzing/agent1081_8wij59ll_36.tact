struct DeepWrap1 { x: Int; }
struct DeepWrap2 { d1: DeepWrap1; }
struct DeepWrap3 { d2: DeepWrap2; }

contract DeepAssignment {
    s: DeepWrap3;

    init() {
        self.s = DeepWrap3{ d2: DeepWrap2{ d1: DeepWrap1{ x: 5 } } };
    }
}