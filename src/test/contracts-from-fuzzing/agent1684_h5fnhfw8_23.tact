contract OptionalStringDefaultNull {
    s: String?;

    init() {
        // Do not set s, test implicit null default
    }
}