// Contract with a very large string default value in a struct to test size limits
struct BigStr {
    s: String = "This is a very very very very long string to test the handling of large default values in nested structs primitive field.";
}

contract BigStrHolder {
    val: BigStr;
    init() {
        self.val = BigStr{};
    }
}
