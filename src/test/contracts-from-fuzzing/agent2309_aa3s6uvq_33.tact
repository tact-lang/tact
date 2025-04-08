// nested multiple optionals in persistent state, assigned nulls
struct S1 {
    v1: Int?;
    v2: Bool?;
}

struct S2 {
    s1: S1?;
}

contract DeepMultiOpt {
    val: S2?;
    init() {
        self.val = null;
    }
}