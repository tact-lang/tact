struct Subs1 {
    val: Int;
    s: String; 
}

struct Subs2 {
    b: Bool;
    optS: String?;
}

contract AdjacentNestedFields {
    f1: Subs1;
    f2: Subs2;

    init() {
        self.f1 = Subs1{ val: 8, s: "g" };
        self.f2 = Subs2{ b: false, optS: null };
    }
}