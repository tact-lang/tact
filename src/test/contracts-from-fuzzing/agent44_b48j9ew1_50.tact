struct AA {
    a: Int;
}

struct BB {
    b: AA?;
}

contract NestedNullable {
    bb: BB;

    init() {
        self.bb = BB{ b:null };
    }

    receive() {
        self.bb = BB{ b: AA{a:5} };
    }
}