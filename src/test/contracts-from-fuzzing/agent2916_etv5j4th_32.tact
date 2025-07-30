struct Recursive1 {
    a: Int;
}

struct Recursive2 {
    r: Recursive1;
}

struct Recursive3 {
    r: Recursive2;
}

contract OptionalInDeepChain {
    data: Recursive3?;

    init() {
        self.data = null;
    }
}