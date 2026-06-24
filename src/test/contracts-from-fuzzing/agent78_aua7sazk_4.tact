contract TestString {
    receive() {
        dump("Hello, Tact!");
        dump("Escaped: \"Quote\"");
        dump("Emoji: \u{1F602}");
    }
}
