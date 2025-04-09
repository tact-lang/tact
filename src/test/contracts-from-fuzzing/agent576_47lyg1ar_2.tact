struct Deep {
    inner1: StructLevel1;
    inner2: StructLevel1;
}

struct StructLevel1 {
    val: Int;
    next: StructLevel2;
}

struct StructLevel2 {
    flag: Bool;
    text: String?;
}

contract TestContract {
    complex: Deep;
    init() {
        self.complex = Deep{
            inner1: StructLevel1{ val: 1, next: StructLevel2{ flag: true, text: "ok" } },
            inner2: StructLevel1{ val: 2, next: StructLevel2{ flag: false, text: null } }
        };
    }
}