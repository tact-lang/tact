/*
   TonConversionTest verifies that compile-time conversion of Toncoin values using the ton() function
   yields the expected number of nanoToncoins. According to the documentation, 1 Toncoin equals 1,000,000,000 nanoToncoins.

   In this test, we check:
      ton("1") should be 1000000000
      ton("0.5") should be 500000000
*/

contract TonConversionTest() {
    receive() {
        let oneTon = ton("1");
        let halfTon = ton("0.5");
        require(oneTon == 1000000000, "ton(\"1\") did not yield 1000000000");
        require(halfTon == 500000000, "ton(\"0.5\") did not yield 500000000");
        cashback(sender());
    }
}
