struct AA {
    val: Int?;
}

struct BB {
    a: AA?;
}

contract Test {
    bb: BB;

    init() {
        self.bb = BB {
            a: null
        };
    }
}
