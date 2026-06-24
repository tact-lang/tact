fun pureReturn(): Int {
    return 42;
}

fun tryNoCatch(): Int {
    try {
         let a = 5;
    }
    return 100;
}

fun nestedTryReturn(): Int {
    try {
         try {
              throw(200);
         } catch (inner) {
              return inner + 1; // expected: 201
         }
    } catch (outer) {
         return outer; // fallback
    }
    // All paths handled by returns above
}

fun conditionalReturn(): Int {
    try {
         let a = 5;
         if (a > 3) {
              return a * 2; // returns 10
         } else {
              return a;     // would return 5
         }
    } catch (e) {
         return e;
    }
}

fun complexReturnTest(): Int {
    if (true) {
         try {
             let b = 7;
             if (b > 5) {
                  return 55;
             }
         } catch (e) {
             return e;
         }
         return 56;
    }
    return 0;
}

contract ControlFlowComplex {
    receive() {
         let flag = true;
         if (flag) {
              try {
                  if (flag) {
                       throw(300);
                  } else {
                       dump("No exception");
                  }
              } catch (ex) {
                  dump(ex); // should dump 300
                  return;    // exit receive handler
              }
         }
         dump(123);
    }
}
