message MsBounced {
    dummy: Int
}

contract TestBouncedCorrect {
    // Correct bounced receiver: it simply does nothing
    bounced(src: bounced<MsBounced>) {
        // No field access as bounced types do not have a "body" field
    }
}
