contract TestTonLeadingZeros {
    // Testing ton() with leading zeros in the string
    // Expecting: ton("001") to be equivalent to ton("1")
    value: Int = ton("001");

    receive() {}
}
