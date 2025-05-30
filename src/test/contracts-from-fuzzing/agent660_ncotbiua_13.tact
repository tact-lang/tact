struct S { f: Int = 7; }

contract Nullify {
    s: S?;
    init() { self.s = S{f: 123}; }
    receive() {
        self.s = null;
    }
}