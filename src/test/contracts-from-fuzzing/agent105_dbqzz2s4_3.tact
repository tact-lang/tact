contract Test3 {
  fun test1() : Int {
    {
      if (1 < 2) {
        return 10;
      }
    }
    return 20;
  }
}
