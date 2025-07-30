struct First {
    a: Int;
}
struct Second {
    inner: First?;
}

contract Fuzz19 {
    val: Second;

    init() {
        self.val = Second{ inner: null };
    }
}