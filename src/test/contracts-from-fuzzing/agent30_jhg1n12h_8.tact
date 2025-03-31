message EmptyMsg {}

contract BounceDouble {
    // Typed bounced receiver
    bounced(msg: bounced<EmptyMsg>) {
    }

    // Fallback bounced receiver handling any bounced message as raw Slice
    bounced(raw: Slice) {
    }
}
