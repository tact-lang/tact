fun testForceBasechain() {
   // someBasechain should pass
   let someBasechain: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc66);
   forceBasechain(someBasechain);
   
   // someMasterchain should trigger an error, so we catch the error and verify its code is 138
   let someMasterchain: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc66);
   try {
       forceBasechain(someMasterchain);
   } catch (exitCode) {
       require(exitCode == 138, "Expected exit code 138");
   }
}

fun main() {
    testForceBasechain();
}
