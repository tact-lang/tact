struct Rec1 {
    x: Int;
    rec2: Rec2;
}

struct Rec2 {
    y: Int;
    rec3: Rec3;
}

struct Rec3 {
    z: Int;
}

contract StorageRecursiveFlatTest {
    data: Rec1;

    init() {
        self.data = Rec1{
            x: 1,
            rec2: Rec2{
                y: 2,
                rec3: Rec3{z:3}
            }
        };
    }
}