struct RecA {
    valA: Int; 
}

struct RecB {
    valB: Int;
    nestedA: RecA;
}

struct RecC {
    valC: Int?;
    nestedB: RecB;
}

contract TestContract {
    data: RecC;
    init() {
        self.data = RecC{
            valC: null,
            nestedB: RecB{
                valB: 42,
                nestedA: RecA{
                    valA: 7,
                },
            },
        };
    }
}