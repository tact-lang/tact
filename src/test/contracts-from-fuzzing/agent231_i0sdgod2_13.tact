// test empty optional persistence default
contract OptDefaults {
    x: Int?;  // implicit default null

    init() {
        // no explicit assign, should default to null
    }
}