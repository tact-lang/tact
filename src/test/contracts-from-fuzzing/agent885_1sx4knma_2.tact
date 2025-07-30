struct InnerB {
    x: Int;
    y: String;
    z: Bool?;
}

struct InnerA {
    m: InnerB;
    n: Bool;
}

contract TestContract {
    fieldA: InnerA;

    init() {
        self.fieldA = InnerA{
            m: InnerB{
                x: 10,
                y: "nested",
                z: null,
            },
            n: false,
        };
    }
}