contract TestDivision() {
    fun test() {
         // Division rounds toward negative infinity (floor division):
         // 3 / 2 should be 1 (since 1.5 floors to 1)
         // -3 / 2 should be -2 (since -1.5 floors to -2)
         let a = 3 / 2;   // expect 1
         let b = -3 / 2;  // expect -2
         
         // Modulo operator properties:
         // 1 % 5 should be 1
         // 1 % -5 should be -4 (because 1 - (-5)*ceil(1/(-5)) = 1 - (-5)*0 = 1, or docs claim differently)
         let c = 1 % 5;   // expect 1
         let d = 1 % -5;  // expect -4, as stated in docs above

         dump(a);
         dump(b);
         dump(c);
         dump(d);
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
