struct DefStruct {
    x: Int = 10;
    y: Bool = true;
}

contract TestContract {
    opt: DefStruct? = null;

    receive() {
        let _ = self.opt;
    }
}