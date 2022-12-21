struct Context {
    bounced: Bool;
    sender: Address;
    value: Int;
}

@name(__tact_context_get)
native context(): Context;