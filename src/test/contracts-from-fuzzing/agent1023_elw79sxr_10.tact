struct StructA {
    valA: Int;
}

struct StructB {
    valB: Bool;
    nestedA: StructA;
}

struct StructC {
    valC: String;
    nestedB: StructB;
}

contract TestContract {
    data: StructC;

    init() {
        self.data = StructC{
            valC: "hi",
            nestedB: StructB{
                valB: false,
                nestedA: StructA{ valA: 999 }
            }
        };
    }
}