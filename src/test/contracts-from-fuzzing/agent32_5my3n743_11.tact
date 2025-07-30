/*
Test: Test the 'ton' compile-time function with a valid input: "1".
Expected: Compilation succeeds and returns 1000000000 (1 Toncoin = 10^9 nanoToncoins).
*/

contract TestTonValid {
    one: Int = ton("1");

    receive() {}
}
