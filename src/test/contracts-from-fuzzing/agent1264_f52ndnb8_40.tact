struct InnerA {
    a: Int; 
}
struct InnerB {
    b: Int; 
}

struct Combined {
    a: InnerA;
    b: InnerB;
    val: Int;
}

contract MultiStructFieldContract {
    data: Combined;
    init() {
        self.data = Combined{
            a: InnerA{a:1}, b: InnerB{b:2}, val:3
        };
    }
}