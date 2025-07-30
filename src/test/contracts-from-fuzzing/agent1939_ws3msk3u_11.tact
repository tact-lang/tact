struct S5 {
    n1: Int;
    n2: Int as uint8;
    n3: Int as int32;
    n4: Int as uint4;
}

contract TestContract {
    data: S5;
    init() {
        self.data = S5{ n1: 1, n2:2, n3:3, n4:4 };
    }
}