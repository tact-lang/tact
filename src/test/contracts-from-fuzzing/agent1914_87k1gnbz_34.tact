struct OptionalLayer {
    o: Int?;
}

contract TestOptional {
    value: OptionalLayer;

    init() {
        self.value = OptionalLayer{ o: null };
    }
}