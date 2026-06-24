contract TestCommentLengthExact {
    // The string literal below has exactly 123 'a' characters: 12*10 + 3 = 123
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
         // If compiled successfully, the receiver message is accepted as exactly 123 bytes long.
    }
}
