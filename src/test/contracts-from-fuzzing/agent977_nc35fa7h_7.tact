// multiple nested structs with inner optional, stored in contract
struct A { first: Int; second: Int?; }
struct B { inn: A; val: Int; }
struct C { more: B; tail: Int; }
contract NestLots {
    data: C;
    init() {
        self.data = C{
            more: B{
                inn: A{ first:1, second:null },
                val: 2
            },
            tail:3
        };
    }
}