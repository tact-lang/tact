struct T1 { a: Int?; }
struct T2 { b: Bool?; }
struct T3 { c: String?; }

contract MixedOptStructs {
    t1: T1;
    t2: T2;
    t3: T3;

    init() {
        self.t1 = T1{ a: null };
        self.t2 = T2{ b: null };
        self.t3 = T3{ c: null };
    }
}
