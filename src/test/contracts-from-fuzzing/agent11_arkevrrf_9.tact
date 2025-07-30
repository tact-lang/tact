/* Test 28: Getter returning a nested optional structure */
struct Inner { x: Int; }
struct Outer { i: Inner; }

contract C5 {
    get fun getOuter(cond: Bool): Outer? {
        if (cond) {
            return Outer { i: Inner { x: 10 } };
        }
        return null;
    }
}

/* Test 29: Function with multiple nested blocks containing return statements */
fun blockReturnVariants(x: Int): Int {
    {
        if (x > 0) {
            return x;
        }
    }
    {
        if (x < 0) {
            return -x;
        }
    }
    return 0;
}
