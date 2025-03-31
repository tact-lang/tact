struct Pair { a: Int; b: Int }

fun regularReturn(x: Int): Int {
    if (x < 10) {
        return x;
    } else {
        return x + 10;
    }
}

fun nestedBlockReturn(y: Int): Int {
    {
      {
          if (y == 0) {
              return 100;
          }
      }
    }
    return y;
}

fun loopReturn(n: Int): Int {
    repeat(n) {
        if (n == 5) {
            return n;
        }
    }
    return 0;
}

fun implicitBlockReturn(): Int {
    { return 42 }  // block with explicit return inside
}

contract TestGetter {
    v: Int = 0;
    get fun getVal(): Int {
         if (self.v > 0) {
             return self.v;
         } else {
             return 0;
         }
    }
}

contract ReceiverTest {
    v: Int = 0;
    receive (msg: Slice) {
         // In a receiver, simply returning is allowed
         return;
    }
}

contract ComplexGetter {
    v: Int = 0;
    get fun computed(): Pair {
       if (self.v > 10) {
          return Pair{ a: self.v, b: self.v * 2 };
       }
       return Pair{ a: self.v, b: 0 };
    }
}

fun main() {
    regularReturn(5);
    nestedBlockReturn(0);
    loopReturn(1);
    implicitBlockReturn();
}
