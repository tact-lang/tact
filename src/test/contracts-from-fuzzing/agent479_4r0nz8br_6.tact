struct Elem {
    num: Int;
    note: String?;
}

contract SimulatedArray {
    e1: Elem;
    e2: Elem;
    e3: Elem;

    init() {
        self.e1 = Elem{num: 1, note: "a"};
        self.e2 = Elem{num: 2, note: null};
        self.e3 = Elem{num: 3, note: "c"};
    }
}