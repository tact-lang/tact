contract Test {
    const MY_CONSTANT: Int = 42;

    // no usage in function body
    // This compiles the constant declaration within the contract
    receive() {
         // empty receive
    }
}
