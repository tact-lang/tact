message BounceText {
    text: String;
}

contract BounceTextTest {
    bounced(msg: bounced<BounceText>) {
        // Attempting to use bounced text messages, which are not supported as per documentation
        // No processing is done here
    }
}
