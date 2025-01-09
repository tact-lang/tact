contract HelloWorld {

    get fun greeting(): String {
        return "hello world";
    }
    external("foobar") {}
}
