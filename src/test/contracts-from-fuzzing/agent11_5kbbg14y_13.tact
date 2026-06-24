contract TestExtensionCall {
    receive() {
        dump(42.toString());
    }
}
