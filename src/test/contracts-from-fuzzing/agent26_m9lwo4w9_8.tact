message Msg { content: Int; }

trait BounceHandler {
    bounced(msg: bounced<Msg>) {
        // Default bounce handling
    }
}

contract BounceUsingTrait with BounceHandler {
    // Using default bounced from BounceHandler
}
