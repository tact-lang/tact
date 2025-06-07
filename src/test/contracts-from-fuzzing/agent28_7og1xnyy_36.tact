contract TestEmoji {
    receive() {
        // Testing variable-length Unicode escape for an emoji (grinning face) U+1F600
        dump("Emoji: \u{1F600}");
    }
}
