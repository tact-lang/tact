struct A { x: Int?; }
struct B { y: String?; }

contract OptNestedPresent {
    s1: A?;
    s2: B?;

    init() {
        self.s1 = null;
        self.s2 = B{ y: null };
    }
}