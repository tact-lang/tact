contract Test {
    // Testing simple empty message receiver
    receive() {
        // This function should be triggered by an empty message
    }

    // To ensure the function is compiled, we add a dummy function call
    get fun dummy(): Int {
        return 0;
    }
}
