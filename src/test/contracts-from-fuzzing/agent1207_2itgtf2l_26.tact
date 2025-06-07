struct C1 {
    i: Int;
    s: String;
}

struct C2 {
    j: Int?;
    c1: C1?;
}

contract OptStructField {
    val: C2?;

    init() {
        self.val = C2{ j:null, c1:null };
    }
}