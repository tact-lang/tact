struct Imb1 { x: Int; }

struct Imb2 { y: Imb1; }

struct Imb3 { z: Imb2; }

contract Imbricated {
    val: Imb3;

    init() {
        self.val = Imb3{ z: Imb2{ y: Imb1{ x: 77 } } };
    }
}