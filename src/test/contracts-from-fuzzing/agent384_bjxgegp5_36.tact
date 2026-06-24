contract MissingOptionalInit {
    x: Int?;

    init() {
        // left uninitialized on purpose
    }
}