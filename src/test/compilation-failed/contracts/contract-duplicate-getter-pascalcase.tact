contract Test {
    receive () {}

    get fun testGetter(): Int {
        return 123;
    }

    get fun test_getter(): Int {
        return 123;
    }
}

