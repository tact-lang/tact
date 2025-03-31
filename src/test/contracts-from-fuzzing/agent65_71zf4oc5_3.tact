contract TestStrings {
    receive() {
        let emptyString: String = "";
        let nonEmptyString: String = "Hello, Tact!";
        let isEmpty: Bool = emptyString.asSlice().dataEmpty();
        let isNonEmpty: Bool = !nonEmptyString.asSlice().dataEmpty();
        // Dummy operations to satisfy the function requirement
        let check: Int = isEmpty ? 1 : 0;
        let check2: Int = isNonEmpty ? 1 : 0;
    }
}