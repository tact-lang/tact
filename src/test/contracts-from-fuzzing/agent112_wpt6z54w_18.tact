struct Rec1 {
    r2: Rec2?;
}

struct Rec2 {
    r3: Rec3?;
}

struct Rec3 {
    val: Int;
}

contract RecursiveOptional {
    storage: Rec1;

    init() {
        self.storage = Rec1{
            r2: Rec2{
                r3: Rec3{
                    val: 5050
                }
            }
        };
    }
}