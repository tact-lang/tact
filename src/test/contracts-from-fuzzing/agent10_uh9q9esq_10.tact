/// Test Snippet 10: Contract with all three receiver functions (internal, bounced, external)
message BounceData { code: Int }

contract ReceiverTest {
    // Bounced receiver: invoked when an outgoing message bounces back
    bounced(src: bounced<BounceData>) {
        // Usually, some recovery logic would be here
        // For testing, simply do nothing
    }

    // Internal message receiver: reacts to a text message "ping"
    receive("ping") {
        // Normally process internal message
    }

    // External message receiver: reacts to an off-chain message "hello"
    external("hello") {
        // No sender available
    }
}
