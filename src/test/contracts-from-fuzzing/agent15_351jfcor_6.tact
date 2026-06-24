contract BounceRaw {
    // Fallback bounced receiver function that processes raw Slice messages
    bounced(raw: Slice) {
        // For testing, simply do nothing with the raw slice
    }

    receive() {}
}
