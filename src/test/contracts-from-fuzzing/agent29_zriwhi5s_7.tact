message UnnamedMsg {
    num: Int;
}

contract TestUnnamedBounce {
    // Bounce receiver with unused parameter name
    bounced(_ : bounced<UnnamedMsg>) {
        // No operation in bounce handler
    }
}
