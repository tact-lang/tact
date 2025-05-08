// optional primitive with default value not null
contract OptionalDefaultNonNull {
    score: Int? = 5; // this should be invalid: non-null default on optional
    init() {
        self.score = null;
    }
}