// Chain nested structs testing serialization deeply
struct X1 {
    v: Int;
}
struct X2 {
    c: X1;
}
struct X3 {
    c: X2;
}
struct X4 {
    c: X3;
}
struct X5 {
    c: X4;
}

contract SerialChain {
    data: X5;

    init() {
        self.data = X5{
            c: X4{
                c: X3{
                    c: X2{
                        c: X1{ v: 99 }
                    }
                }
            }
        };
    }
}
