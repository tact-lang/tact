struct S1 { val: Int; }

struct S2 { one: S1?; two: Int; }

contract AssignLater {
    data: S2;

    init() {
        self.data = S2{ one:null, two:3 };
    }

    receive() {
        let _ = self.data;
    }
}