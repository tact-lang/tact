struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    opt: Int?;
}

contract MultiRecursion {
    storage: RecA;

    init() {
        self.storage = RecA{
            b: RecB{
                c: RecC{
                    opt: null
                }
            }
        };
    }
}