contract TestLogical {
    fun sideEffect(): Bool {
         dump(999); // if printed, means side effect triggered
         return true;
    }
    fun test() {
         // Test logical not and OR
         let r1 = !(true && false) || false;
         dump(r1); // Expected output: true

         // Test short-circuit: since left operand is false, sideEffect should not trigger
         let r2 = false && self.sideEffect();
         dump(r2); // Expected output: false
    }
    
    receive() {
         self.test();
    }
}
