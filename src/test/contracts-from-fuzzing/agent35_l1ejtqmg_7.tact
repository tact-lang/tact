message MyMsg {
    value: Int;
}

// Define a trait with a bounce receiver
trait BounceTrait {
    bounced(msg: bounced<MyMsg>) {
        // Trait-level bounce receiver
    }
}

// A contract that implements the trait
contract BounceUser with BounceTrait {
    // Additionally, define a normal receive function to check coexistence
    receive(msg: MyMsg) {
        // Normal receive function
    }
}
