contract TestConditionalGetter {
    x: Int = 10;
    y: Int = 20;

    receive () {}

    get fun getConditional(flag: Bool): Int {
         if (flag) {
             return self.x;
         } else {
             return self.y;
         }
    }
}
