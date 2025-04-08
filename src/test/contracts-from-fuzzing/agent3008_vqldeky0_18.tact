struct Rec1 {
    x: Int;
}

struct Rec2 {
    y: Rec1;
}

struct Rec3 {
    z: Rec2;
}

contract Recursion {
    deep: Rec3;

    init() {
        self.deep = Rec3{
            z: Rec2{
                y: Rec1{
                    x: -5,
                },
            },
        };
    }
}