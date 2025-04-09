// test complex nested structure with many optionals
struct X {
    a: Int?;
    b: Y?;
}
struct Y {
    c: Bool?;
    d: Z?;
}
struct Z {
    e: String?;
}
contract Test {
    x: X;
    init() {
        self.x = X{
            a: null,
            b: Y{
                c: null,
                d: Z{e:null}
            }
        };
    }
}