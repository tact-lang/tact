struct StructA {
    val: Int;
    next: StructB;
}

struct StructB {
    flag: Bool;
    nested: StructC;
}

struct StructC {
    text: String;
}

contract TestContract {
    a: StructA;

    init() {
        self.a = StructA{
            val: 1,
            next: StructB{
                flag: true,
                nested: StructC{ text: "end" }
            }
        };
    }
}