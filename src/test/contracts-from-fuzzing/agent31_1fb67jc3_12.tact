message TraitMsg {
    value: Int;
}

// Trait that defines a bounce receiver for messages of type TraitMsg
trait BounceTrait {
    bounced(msg: bounced<TraitMsg>) {
        // Trait-level bounce handling: no-op
    }
}

// Contract using BounceTrait to inherit bounce receiver functionality
contract BounceUsingTrait with BounceTrait {
    receive() {}
}

// Contract that demonstrates using self.forward inside a bounce receiver
message ForwardMsg {
    note: String;
}

contract BounceForwardTest {
    bounced(msg: bounced<ForwardMsg>) {
        // In bounce receiver, call self.forward to notify sender about bounce
        self.forward(sender(), "Bounce occurred".asComment(), false, null);
    }
    
    receive() {}
}
