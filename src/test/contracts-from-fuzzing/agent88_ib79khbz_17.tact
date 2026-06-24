struct Pair { first: Int; second: Int }

fun accumulate(i: Int, n: Int, acc: Int): Int {
    if (i >= n) {
         return acc;
    } else {
         return accumulate(i + 1, n, acc + i);
    }
}

contract TestReturnFuzz {
    // Regular function with explicit returns in all branches
    fun regReturn(x: Int): Int {
         if (x < 0) {
              return -x;
         } else if (x == 0) {
              return 42;
         } else {
              return x + 1;
         }
    }
    
    // Function with a nested block that contains explicit returns
    fun nestedReturn(x: Int): Int {
         if (x > 50) {
              {
                  if (x > 100) {
                      return 777;
                  } else {
                      return 555;
                  }
              }
         }
         return x;
    }
    
    // Function simulating a loop using recursion, with explicit returns
    fun loopReturn(n: Int): Int {
         return accumulate(0, n, 0);
    }
    
    // Getter function with explicit returns in all branches
    get fun getPair(): Pair {
         if (now() % 2 == 0) {
             return Pair{ first: 1, second: 2 };
         } else {
             return Pair{ first: 3, second: 4 };
         }
    }
    
    // Receiver function with early exit
    receive () {
         if (now() % 2 == 0) {
             return;
         }
         dump(999);
         return;
    }
}
