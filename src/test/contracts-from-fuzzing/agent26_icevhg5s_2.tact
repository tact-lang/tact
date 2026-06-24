contract Test {
    // 32 characters exactly: should compile successfully
    a: Int = ascii("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");

    receive () {}
}
