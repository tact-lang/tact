message TraitBounceMsg {
    val: Int;
}

trait TB {
    // Default bounce receiver implementation
    bounced(msg: bounced<TraitBounceMsg>) {
        // Default handling
    }
}

contract A with TB {
    receive() {
        // Normal receive handler
    }
}
