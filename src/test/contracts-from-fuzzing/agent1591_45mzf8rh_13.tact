// contract with optional struct inside persistent storage
struct Small {
    a: Int;
    b: Bool;
}

contract OptStructField {
    maybeSmall: Small?;

    init() {
        self.maybeSmall = null;
    }
}