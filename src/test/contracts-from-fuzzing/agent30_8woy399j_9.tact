struct Inner { x: Int; }

contract TestContract {
    data: Inner? = null;
    receive() { let _ = self.data; }
}