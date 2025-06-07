contract TestAscii32 {
    // Testing ascii with exactly 32 ASCII characters (32 bytes) should compile successfully.
    a: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    receive() {}
}
