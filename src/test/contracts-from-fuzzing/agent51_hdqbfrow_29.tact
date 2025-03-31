contract TestForEachReturn {
    m: map<Int, Int> = emptyMap();
    fun test(): Int {
         self.m.set(1, 5);
         self.m.set(2, 10);
         self.m.set(3, 15);
         foreach (k, v in self.m) {
              if (v == 10) {
                   return v;
              }
         }
         return -1;
    }
}
