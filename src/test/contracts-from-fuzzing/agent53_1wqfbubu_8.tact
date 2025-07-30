struct Pair { a: Int; b: Int }

contract GetterTest {
    v: Int = 5;
    
    get fun getPair(): Pair {
        if (self.v > 10) { return Pair { a: self.v, b: self.v + 1 }; }
        return Pair { a: 0, b: 0 };
    }
}
