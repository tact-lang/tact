struct Atomic {
    atomicVal: Int;
}

contract OptionalStructField {
    optionalData: Atomic?;

    init() {
        self.optionalData = null;
    }
}
