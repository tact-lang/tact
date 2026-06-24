contract Test {
    s: String = "none";

    receive("hello") {
         self.s = "literal";
    }

    receive(str: String) {
         self.s = "fallback";
    }
}
