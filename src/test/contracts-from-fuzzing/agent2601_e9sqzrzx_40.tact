struct Case1 {
    n: Int;
}
struct Case2 {
    m: Int;
}

contract FieldOrdering {
    f1: Case1;
    f2: Case2;
    init() {
        self.f1 = Case1{ n: 1};
        self.f2 = Case2{ m: 2};
    }
}