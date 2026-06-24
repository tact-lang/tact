fun nestedReturnLoop(flag: Bool): Int {
    repeat (1) {
         if (flag) {
             return 100;
         }
    }
    return 200;
}
