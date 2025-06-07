// Optional struct with inner required struct with 'remaining'
struct Part {
    num: Int;
    suffix: Slice as remaining;
}

struct Container {
    part: Part;
}

contract RequiredWithRemaining {
    data: Container?;

    init() {
        self.data = null;
    }
}
