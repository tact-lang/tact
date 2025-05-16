contract TestInvalidBase64 {
    receive() {
        try {
            let s: String = "!!!";
            let _decoded: Slice = s.fromBase64();
        } catch (e) {
            // Catch error, expecting exit code 134 for invalid Base64 string
            let dummy: Int = e;
        }
    }
}
