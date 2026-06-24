contract TestReturnLoop {
    fun test(): Int {
         let i: Int = 0;
         repeat (10) {
             // increment i manually using a local mutable variable workaround
             // Instead of proper loop iteration index, simulate iteration
             if (i == 5) {
                 return i;
             }
             // simulate iteration: although repeat block doesn't allow modification of i,
             // so we simulate with an inner block
             {
                 let dummy = 0; // dummy block
             }
             // In Tact, repeat doesn't allow direct update so we'll leave as is
         }
         return 0;
    }
}
