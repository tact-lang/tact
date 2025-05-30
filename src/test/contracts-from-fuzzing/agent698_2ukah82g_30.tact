struct A { x: Int; y: Int?; }

contract TestContract {
    d1: A;
    d2: A;
    d3: A;

    init() {
        self.d1 = A{ x:1, y:null };
        self.d2 = A{ x:2, y:5 };
        self.d3 = A{ x:3, y:null };
    }
}