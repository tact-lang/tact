// Optional of struct itself optional
struct OptWrap {
    s: String;
}

contract OptStructFieldOpt {
    payload: OptWrap?;

    init() {
        self.payload = null;
    }
}