// Structs with multiple optional structs with separate defaults and nulls
struct A {
    i: Int = 0;
    t: String = "";
}
struct B {
    j: Int?;
    s: String?;
}

contract MultiOptStructs {
    f1: A?;
    f2: A?;
    f3: B?;
    f4: B?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}
