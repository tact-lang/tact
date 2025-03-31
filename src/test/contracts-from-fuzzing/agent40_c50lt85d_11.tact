contract TestAsSlice {
    receive() {
         let s: String = "hello world";
         let sl: Slice = s.asSlice();
         if (sl.asString() == s) {
             // asSlice() and asString() conversion consistent with original string
         }
    }
}
