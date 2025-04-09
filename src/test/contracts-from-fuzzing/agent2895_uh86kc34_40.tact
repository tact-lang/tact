struct A { s: String }

contract OptionalStructWithString {
    val: A?;
    init() {
        self.val = null;
    }
}
