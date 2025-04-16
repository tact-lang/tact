struct OptionalGrouping {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptionComb {
    o1: OptionalGrouping;
    o2: OptionalGrouping;
    val: Int;

    init() {
        self.o1 = OptionalGrouping{ a:null, b:null, c:null };
        self.o2 = OptionalGrouping{ a:null, b:null, c:null };
        self.val = 9;
    }
}