contract TestAsciiBoundary {
    // 32 characters exactly; should compile successfully
    a: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    receive () {}
}
