contract P(p: Int) {}

contract Tester {
    fun diff() : Bool {
         let i1 = initOf P(10);
         let i2 = initOf P(20);
         // The differing parameter should affect the data, hence the hash should be different
         return contractHash(i1.code, i1.data) != contractHash(i2.code, i2.data);
    }

    fun compareSelf() : Bool {
         // Repeated calls to initOf on the same contract with the same parameters yield identical state
         let s1 = initOf P(30);
         let s2 = initOf P(30);
         return contractHash(s1.code, s1.data) == contractHash(s2.code, s2.data);
    }
}
