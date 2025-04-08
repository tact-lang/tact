struct OptionalSerialized {
    val: Int? as uint8;
}

contract SerializedOptionalField {
    data: OptionalSerialized;

    init() {
        self.data = OptionalSerialized{
            val: 127
        };
    }
}
