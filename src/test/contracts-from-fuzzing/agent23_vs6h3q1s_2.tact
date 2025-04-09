contract StringOperation {
    receive() {
        let s: String = "Test String";
        let modified: String = s.asSlice().asString(); // String to Slice and back
    }
}