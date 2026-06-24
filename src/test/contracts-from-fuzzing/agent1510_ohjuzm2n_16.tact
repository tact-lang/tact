message(42) MyMsg {
    val: Int;
    extra: Int?;
}

struct Container {
    innerMsg: MyMsg;
    note: String = "hi";
}

contract TestContract {
    persist: Container = Container{innerMsg: MyMsg{val:123, extra:null}, note:"hi"};

    init() {
        self.persist = Container{innerMsg: MyMsg{val:456, extra:null}, note:"bye"};
    }

    receive() {
        let _ = self.persist;
    }
}