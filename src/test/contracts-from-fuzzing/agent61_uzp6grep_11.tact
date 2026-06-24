contract TestGetterOptional {
    // v is an optional Int (default initialized to null)
    v: Int?;

    init() {
        // Explicitly setting v to null is optional because uninitialized optionals default to null
        self.v = null;
    }

    receive() {}

    // Getter returning an optional Int
    get fun optValue(): Int? {
         return self.v;
    }
}
