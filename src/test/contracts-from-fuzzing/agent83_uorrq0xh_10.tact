contract ComplexReturnTest {
  
  // Function with multiple return paths
  fun multi_return(x: Int): Int {
    if (x == 0) {
      return 0;
    } else if (x > 0) {
      {
         if (x == 1) {
            return 1;
         }
         let y: Int = x + 1;
         return y;
      }
    } else {
      let i: Int = 0;
      repeat (3) {
         if (i == 1) {
             return i;
         }
         i = i + 1;
      }
      return -1;
    }
  }

  // Function with nested returns in loops
  fun loop_nested_return(): Int {
    let i: Int = 0;
    repeat (3) {
      if (i == 2) {
         return i;
      }
      i = i + 1;
    }
    return -100;
  }

  // Getter with conditional return using nested blocks
  get fun getter_conditional(): Int {
    if (self.multi_return(5) > 5) {
       return 10;
    } else {
       return 5;
    }
  }

  // Function to check implicit fallthrough with nested blocks
  fun test_implicit(x: Int): Int {
      if (x < 0) {
         { { return -x; } }  // nested block explicit return
      }
      // Fallthrough
      return x;
  }

  /* The following function is intentionally erroneous, as it lacks a return on some branch.
  Uncommenting it should result in a compilation error.
  fun missing_return(x: Int): Int {
    if (x > 10) {
       return x;
    }
    // Missing return here
  }
  */
}
