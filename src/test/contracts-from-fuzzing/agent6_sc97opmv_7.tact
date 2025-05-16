contract TestTonValid {
    one: Int = ton("1");            // should be 10^9
    pointOne: Int = ton("0.1");       // should be 10^8
    nano: Int = ton("0.000000001");   // should be 1
    
    // dummy receive to make contract valid
    receive () {}
}
