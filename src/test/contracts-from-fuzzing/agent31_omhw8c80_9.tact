contract Test {
    counterSpecific: Int = 0;
    counterArbitrary: Int = 0;
    counterFallback: Int = 0;

    // Receiver for specific text "match"
    receive("match") {
        self.counterSpecific = self.counterSpecific + 1;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.counterArbitrary = self.counterArbitrary + 1;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.counterFallback = self.counterFallback + 1;
    }
}
