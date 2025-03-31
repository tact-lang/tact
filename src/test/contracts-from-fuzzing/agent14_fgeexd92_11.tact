contract TestTonValid {
    // Valid Ton conversion: "1" -> 10^9, "0.1" -> 10^8, "0.000000001" -> 1
    one: Int = ton("1");
    pointOne: Int = ton("0.1");
    nano: Int = ton("0.000000001");

    receive () {}
}
