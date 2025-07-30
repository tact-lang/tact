struct OptBool { x: Bool?; }
struct OptWrap { s: OptBool?; }

contract TestContract {
    s: OptWrap?;

    init() {
        self.s = null;
    }
}
