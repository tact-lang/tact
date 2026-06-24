// minimal but intentionally conflicting mix: optional & concrete field,
// but optional with default, concrete *without* default, no init()
contract MinimalConflict {
    a: Int? = null;
    b: Int;
    init() {
        self.b = 42;
    }
}
