message(321) Response {
    code: Int;
    ok: Bool;
}

contract TestContract {
    lastResponse: Response?;

    init() {
        self.lastResponse = Response{ code: 200, ok: true };
    }
}