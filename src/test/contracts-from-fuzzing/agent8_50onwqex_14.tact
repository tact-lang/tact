contract Test {
    receive() {
         // Testing foreach loop over a map using documentation syntax
         let m: map<Int, Int> = emptyMap();
         m.set(1, 100);
         m.set(2, 200);

         let total: Int = 0;
         foreach (key, value in m) {
             total = total + value;
         }
         dump(total);
    }
}
