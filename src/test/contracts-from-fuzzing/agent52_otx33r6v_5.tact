contract A {
    init() {}
    receive() {
         // Test: Using codeOf as expression statement in receiver
         codeOf A;
    }
}
