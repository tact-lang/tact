struct FirstLayer {
    intVal: Int;
    next: SecondLayer;
}

struct SecondLayer {
    flag: Bool;
    note: String;
    leaf: LeafLayer;
}

struct LeafLayer {
    data: String;
    success: Bool;
}

contract ThreeLevelNested {
    root: FirstLayer;
    init() {
        self.root = FirstLayer{
            intVal: 7,
            next: SecondLayer{
                flag: false,
                note: "deep",
                leaf: LeafLayer{ data: "leaf", success: true }
            }
        };
    }
}