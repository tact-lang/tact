message(123) Msg {
    x: Int;
}

struct Container {
    optMsg: Msg?;  
    val: Int = 0;
}

contract TestContract {
    storage: Container = Container{optMsg: null, val: 0};

    init() {
        self.storage = Container{optMsg: null, val: 42};
    }

    receive() {
        let _ = self.storage;
    }
}