message MyMsg {
    val: Int;
}

// Test 1: Bounce receiver with underscore parameter
contract BounceUnderscore {
    bounced(_msg: bounced<MyMsg>) {
        // Parameter discarded
    }
}

// Test 2: Bounce receiver in a trait and later inherited by a contract
trait BounceTrait {
    bounced(msg: bounced<MyMsg>) {
        // Trait-level bounce handling
    }
}

contract BounceImpl with BounceTrait {
    // Inherits bounce receiver from BounceTrait
    receive() {
        // Simple receive function
    }
}

// Test 3: Multiple bounce receivers: typed and fallback raw
contract BounceMulti {
    // Typed bounce receiver
    bounced(msg: bounced<MyMsg>) {
        // Handle typed bounced message
    }

    // Fallback bounce receiver handling any bounced message
    bounced(raw: Slice) {
        // Fallback handler
    }
}
