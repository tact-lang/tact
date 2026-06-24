message MyMsg {
    value: Int;
}

contract TestBouncedUnderscore {
    // bounced receiver using underscore to discard the parameter
    bounced(_: bounced<MyMsg>) {}
}
