contract TestContract {
    x: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡"); // 8 times "⚡", each is 3 bytes => 24 bytes total

    receive() {
        // no-op
    }
}
