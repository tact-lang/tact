contract TestReceiverReturn {
    receive() {
        // receivers in Tact are not meant to return a value
        // Attempting to use 'return' here is allowed only if no value is specified
        return;
    }
}
