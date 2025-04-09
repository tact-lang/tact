struct NestOne {
    a: Int;
}
struct NestTwo {
    b: NestOne;
}
contract MultilevelStore {
    n2: NestTwo;

    init() {
        self.n2 = NestTwo{
            b: NestOne{ a: 42 }
        };
    }
}
