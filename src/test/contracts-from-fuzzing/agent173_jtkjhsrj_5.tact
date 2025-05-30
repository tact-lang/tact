contract Test {
    // Fallback receiver for unmatched binary messages using Slice
    receive(msg: Slice) {
        // handle fallback binary message
    }

    // Dummy function so compilation includes receiver
    get fun test(): Int {
        return 100;
    }
}