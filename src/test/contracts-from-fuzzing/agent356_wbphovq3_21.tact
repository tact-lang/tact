struct SubA {
    val: Int;
}

struct SubB {
    val: Bool;
}

struct Combined {
    a: SubA;
    b: SubB;
}

contract StructsInStructs {
    combined: Combined;

    init() {
        self.combined = Combined{
            a: SubA{ val: 1 },
            b: SubB{ val: true }
        };
    }
}