/*
  Test 2: Valid use of newAddress with masterchain (-1).
  According to the documentation, newAddress(-1, hash) is allowed for the masterchain.
*/
fun testMasterAddress(): Address {
    return newAddress(-1, 0);
}
