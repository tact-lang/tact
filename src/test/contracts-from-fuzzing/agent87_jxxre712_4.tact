contract TestStringSlice {
    receive() {
        let original: String = "Convert this string to slice and back!";
        let slice: Slice = original.asSlice();
        let convertedBack: String = slice.asString();
        emit(convertedBack.asComment());
    }
}