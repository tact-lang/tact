struct Inner { val: Int?; }

contract Test {
    data: Inner?;
    init() { self.data = null; }
    receive() {}
}