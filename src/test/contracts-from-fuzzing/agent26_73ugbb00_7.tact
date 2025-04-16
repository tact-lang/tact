struct Pair { a: Int; b: Int }

contract TestGetter {
    v: Int = 10;

    get fun getPair(): Pair {
         if (self.v % 2 == 0) {
              return Pair{ a: self.v, b: self.v * 2 };
         } else {
              return Pair{ a: self.v, b: self.v * 3 };
         }
    }
}
