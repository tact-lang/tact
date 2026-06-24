// Large number of persistent booleans
contract TestContract {
    b01: Bool = false;
    b02: Bool = true;
    b03: Bool = false;
    b04: Bool = true;
    b05: Bool = false;
    b06: Bool = true;
    b07: Bool = false;
    b08: Bool = true;
    b09: Bool = false;
    b10: Bool = true;
    b11: Bool = false;
    b12: Bool = true;
    b13: Bool = false;
    b14: Bool = true;
    b15: Bool = false;
    b16: Bool = true;

    init() {}

    receive() {
        let _ = self.b16;
    }
}