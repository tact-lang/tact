struct A { x: Int; y: String?; }
struct B { i: Int; j: Bool; k: String; a: A; }
struct C { m: Bool; b: B; }

contract TestContract {
    var1: A;
    var2: B;
    var3: C;

    init() {
        self.var1 = A{
            x: 1,
            y: "y",
        };
        self.var2 = B{
            i: 2,
            j: true,
            k: "k",
            a: self.var1,
        };
        self.var3 = C{
            m: false,
            b: self.var2,
        };
    }
}