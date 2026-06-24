message(10) Empty {}

struct Wrapper {
    m: Empty;
}

contract UseMessage {
    val: Wrapper;

    init() {
        self.val = Wrapper{ m: Empty{} };
    }
}