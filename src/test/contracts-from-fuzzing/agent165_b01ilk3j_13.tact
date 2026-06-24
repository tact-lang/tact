contract Test {
    external("test_external") {
        // This external receiver should fail compilation if external messages are not enabled in the project config
    }
}
