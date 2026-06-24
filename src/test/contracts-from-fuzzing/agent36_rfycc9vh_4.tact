message SmallMsg {
    flag: Bool;
}

contract BounceAmbiguous {
    bounced(msg: bounced<SmallMsg>) {
        // Process typed bounced message
    }

    bounced(raw: Slice) {
        // Fallback handler for any bounced message
    }
}
