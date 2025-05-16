struct Rec1 {
    x: Int;
}

struct Rec2 {
    y: Rec1;
}

struct Rec3 {
    z: Rec2;
}

contract Nest3Structs {
    data: Rec3;

    init() {
        self.data = Rec3{ z: Rec2{ y: Rec1{ x: 42 } } };
    }
}