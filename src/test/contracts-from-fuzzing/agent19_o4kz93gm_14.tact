contract TestForeach {
    receive() {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         let s: Int = 0;
         foreach (k, v in m) {
              s += v;
         }
         dump(s);
    }
}
