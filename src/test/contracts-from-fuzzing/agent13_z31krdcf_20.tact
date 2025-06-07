contract NestedTryTest {
    receive() {
         try {
             let xs: Slice = beginCell().storeUint(0, 1).endCell().beginParse();
             let x: Int = xs.loadUint(1); // x becomes 0
             try {
                 // Division by zero, expected to throw exit code 4
                 let a: Int = 1 / x;
             } catch (innerErr) {
                 // innerErr should be exit code 4; add 10 to it
                 let result: Int = innerErr + 10; // expected 14
                 dump(result);
             }
         } catch (outerErr) {
             dump(outerErr);
         }
         cashback(sender());
    }
}
