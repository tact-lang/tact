struct RecInner {
    innerVal: Int;
}

struct Outer {
    inn: RecInner;
}

contract Test {
    v1: Outer?;
    v2: Outer;

    init() {
        self.v1 = null;
        self.v2 = Outer{ inn: RecInner{ innerVal: 55 } };
    }

    receive() {
        let _ = self.v2.inn.innerVal;
    }
}