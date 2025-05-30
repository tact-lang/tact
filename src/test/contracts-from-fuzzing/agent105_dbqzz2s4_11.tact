contract TestRepeatReturn {
  fun test() : Int {
    let result: Int = 0;
    repeat (5) {
      if (result == 0) {
         return 99;
      }
    }
    return result;
  }
}
