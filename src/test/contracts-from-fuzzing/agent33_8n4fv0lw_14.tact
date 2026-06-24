message MyMessage {
    x: Int;
}

trait BounceTrait {
    bounced(msg: bounced<MyMessage>) {
        // Default implementation does nothing
    }
}

contract BounceUsingTrait with BounceTrait {
    init() {
        // No specific initialization
    }
}
