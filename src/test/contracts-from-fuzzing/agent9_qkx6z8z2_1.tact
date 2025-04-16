contract Test1 {
    receive() {}
    get fun testReturn(): Int {
       if (true) {
          return 42;
       }
       return 0;
    }
}
