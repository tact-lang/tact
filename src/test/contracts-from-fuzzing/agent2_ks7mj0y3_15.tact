contract Test {
    receive() {
        let s: String = "S2V2aW4gaXMgYXdlc29tZQ=="; // "Kevin is awesome"
        let slice = s.fromBase64();
    }
}