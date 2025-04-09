contract BounceRawReceiver {
    bounced(rawMsg: Slice) {
        // For testing, just accept the raw bounced message without processing further
        // Optionally, one could attempt to decode it if needed
    }
}
