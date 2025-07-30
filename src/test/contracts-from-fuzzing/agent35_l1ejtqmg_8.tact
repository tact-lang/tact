message MyMsg {
    value: Int;
}

contract UnderscoreBounce {
    // Bounce receiver with underscore discarding parameter value
    bounced(_ : bounced<MyMsg>) {
        // intentionally left empty
    }
}
