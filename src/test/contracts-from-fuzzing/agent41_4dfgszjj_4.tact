contract RawBounceReceiver {
    // bounced receiver handling all bounced messages as raw Slice
    bounced(rawMsg: Slice) {
        // In a real scenario, we might decode the raw message
        // For testing, we just ignore it
    }
}
