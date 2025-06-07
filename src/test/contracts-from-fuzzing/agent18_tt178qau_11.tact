/* Test: Valid usage of ton() compile-time function
   This test verifies that the ton function correctly converts human-readable Toncoin amounts to nanoToncoins
   Usage:
     - "1" should convert to 10^9 nanoToncoins
     - "0.1" should convert to 10^8 nanoToncoins
     - "0.000000001" should convert to 1 nanoToncoin
*/

contract TestTonValid {
    one: Int = ton("1");
    tenth: Int = ton("0.1");
    nano: Int = ton("0.000000001");

    receive() {}
}
