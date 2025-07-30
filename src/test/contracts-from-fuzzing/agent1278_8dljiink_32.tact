message(1) AA { x: Int; }
message(2) BB { y: Int; }

contract TestContract {
    a: AA;
    b: BB;

    init() {
        self.a = AA{ x: 10 };
        self.b = BB{ y: 20 };
    }
}