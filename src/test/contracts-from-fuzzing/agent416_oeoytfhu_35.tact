struct InnerMost {
    val: Int;
}
struct MidLevel {
    nest: InnerMost;
}

contract Test35 {
    field: MidLevel?;

    init() {
        self.field = null;
    }
}
