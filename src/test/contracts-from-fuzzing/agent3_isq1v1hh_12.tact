contract Test {
    receive() {
        // Optional + ternary operator test: if a is not null, use non-null assertion, else use -1
        let a: Int? = null;
        dump(a != null ? a!! : -1);
    }
}
