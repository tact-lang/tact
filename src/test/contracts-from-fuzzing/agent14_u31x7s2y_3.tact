contract TestGetter {
    v: Int = 10;
    
    get fun getValue(flag: Bool): Int {
         if (flag) {
             return self.v;
         } else {
             return self.v + 5;
         }
    }
}
