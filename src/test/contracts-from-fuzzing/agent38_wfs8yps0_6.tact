contract BounceFallback {
    // Fallback bounced receiver that accepts any bounced message as a raw Slice
    bounced(raw: Slice) {
        // For demonstration, simply do nothing
    }

    receive() {}
}
