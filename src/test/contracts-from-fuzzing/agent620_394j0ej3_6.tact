struct Data {
    val: Int;
}

contract TestContract {
    info: Data?;

    init() {
        self.info = null;
    }

    receive() {
        if (self.info != null) {
            let _ = self.info!!.val;
        }
    }
}