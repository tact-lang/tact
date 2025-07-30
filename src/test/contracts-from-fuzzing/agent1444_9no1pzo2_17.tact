struct Payload {
    a: Bool;
    b: String;
    c: Int?;
}

struct Container {
    payload: Payload;
    info: String;
}

contract OptComplex {
    info: Container?;

    init() {
        self.info = null;
    }
}
