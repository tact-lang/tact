message Empty {}

contract TestContract {
    m: Empty;
    init() { self.m = Empty{}; }
    receive() {}
}