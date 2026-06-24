message M {}

contract C {
    m: M?;

    init() {
        self.m = null;
    }
}