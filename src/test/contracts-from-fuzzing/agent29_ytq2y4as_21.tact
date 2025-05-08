contract OptionalUninitialized {
    // optional persistent variables, without default values, uninitialized in init()
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        // no assignment to any of the above
    }
}