message EmptyBounce {}

contract BounceTestEmpty {

    init() {}

    bounced(msg: bounced<EmptyBounce>) {
        // Do nothing; just testing bounced receiver with an empty message
    }
}
