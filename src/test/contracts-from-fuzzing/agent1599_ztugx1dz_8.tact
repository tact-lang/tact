struct InnerA {
    a: Int;
    b: Bool;
}
struct InnerB {
    c: String;
    d: Address;
}
struct Outer {
    x: InnerA;
    y: InnerB;
    z: Int;
}

contract ManyNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: InnerA{ a:1, b:true },
            y: InnerB{ c:"ok", d:myAddress() },
            z: 777
        };
    }
}