contract OptionalSkipAssign {
    a: Int?;
    b: Bool?;

    init() {
        // skip assignments, leave default nulls
    }
}