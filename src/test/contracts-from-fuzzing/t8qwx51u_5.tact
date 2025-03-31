fun main(): Int {
    // Test customPow function from early docs:
    // Documentation in [docs_book_functions.md]   mentions defining global static functions.
    
    // customPow works as defined in early docs
    let result: Int = customPow(3, 4); // expect 81
    return result;
}

fun customPow(a: Int, c: Int): Int {
  let res: Int = 1;
  repeat(c) {
    res *= a;
  }
  return res;
}
