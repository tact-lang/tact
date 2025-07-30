struct OptA {
    a: Int?;
}

struct OptB {
    b: OptA?;
}

contract OptionalUp {
    val: OptB;

    init() {
        self.val = OptB{b:null};
    }

    receive() {
        self.val.b = OptA{a:22};
    }
}