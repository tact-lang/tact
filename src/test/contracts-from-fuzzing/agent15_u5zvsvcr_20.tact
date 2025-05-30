contract TestIntExtension {
    receive() {
         let s: String = 42.toString();
         s.asComment();
    }
}
