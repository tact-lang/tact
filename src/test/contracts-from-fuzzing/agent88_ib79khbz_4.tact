struct TwoInts { a: Int; b: Int }

contract Test {
    fun testRegular(x: Int): Int {
         if (x > 10) {
              return x;
         }
         let y: Int = x * 2;
         return y;
    }

    get fun getTwoInts(): TwoInts {
         if (1 > 2) {
              return TwoInts{ a: 100, b: 200 };
         } else {
              return TwoInts{ a: 300, b: 400 };
         }
    }

    receive () {
         // In receivers, return acts as early exit; receivers do not return a value
         if (now() % 2 == 0) {
              return;
         }
         dump(123);
         return;
    }

    fun loopReturn(n: Int): Int {
         let total: Int = 0;
         let i: Int = 0;
         while (i < n) {
              if (i == 3) {
                  return total; // early exit
              }
              total = total + i;
              i = i + 1;
         }
         return total;
    }
}
