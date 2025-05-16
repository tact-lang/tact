contract GetterTest {
    v: Int = 5;

    get fun getVal(): Pair {
         if (self.v > 0) {
             { return Pair { a: self.v, b: self.v + 1 }; }
         } else {
             {
               let tmp: Int = self.v * 2;
               return Pair { a: tmp, b: tmp - 1 };
             }
         }
    }
}

struct Pair { a: Int; b: Int }