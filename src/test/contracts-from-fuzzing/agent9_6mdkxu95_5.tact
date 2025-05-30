contract TestContract {
    receive() {}

    receive("testBool") {
        dump(true);
        dump(false);
    }
}
