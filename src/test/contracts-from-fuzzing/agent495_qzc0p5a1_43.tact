// test contract field of tuple-like struct, nested
struct Pair { a: Int; b: Int }
struct Container { pair: Pair }
contract CT {
    s: Container;
    init(){
        self.s = Container{ pair: Pair{ a:1, b:2 } };
    }
}