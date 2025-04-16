/// This snippet tests recursion combined with inline function expansion, an advanced feature of the Tact compiler.

// Define an inline function to add two integers. Inline functions are expanded at the call site to save the gas cost of a function call.
inline fun inlineAdd(a: Int, b: Int): Int {
    return a + b;
}

// A recursive function that uses the inline function.
// It computes the sum of numbers from n down to 1.
fun recursionTest(n: Int): Int {
    if (n <= 0) {
        return 0;
    } else {
        return inlineAdd(n, recursionTest(n - 1));
    }
}

// The entry point that returns the result of recursionTest(10).
// Expected result: 10 + 9 + ... + 1 = 55
fun main() : Int {
    return recursionTest(10);
}
