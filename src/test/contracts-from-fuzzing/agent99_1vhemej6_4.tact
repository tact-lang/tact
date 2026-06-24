/*
  Valid Return Behavior Tests in Tact
  This snippet validates multiple return statement behaviors:
  - Nested blocks with early returns
  - Loop with early return inside a repeat block
  - Functions returning optional values
  - Proper use of return in receiver functions (bare return expected)

  Expected behavior:
    - nestedReturn(6) should return 6 * 10 = 60
    - optionalReturn(5) should return 5
    - The receiver function in contract ReceiverValid should compile and use bare return
*/

fun nestedReturn(a: Int): Int {
    if (a > 5) {
        { return a * 10; }  // nested block early return
    } else {
        repeat (a) {
            if (a == 3) { return 333; }
        }
        return 444;
    }
}

fun optionalReturn(a: Int): Int? {
    if (a > 0) {
        return a;
    } else {
        return null;
    }
}

contract ReceiverValid {
    // Receiver functions do not expect to return a value, so a bare 'return;' is correct
    receive("ok") {
        return;
    }
}

fun main() {
    dump(nestedReturn(6));      // Expected output: 60
    dump(optionalReturn(5));     // Expected output: 5
}
