struct HasDefault {
    a: Int = 1;
    b: String = "text";
}

contract TestContract {
    val: HasDefault;
    
    init() {
        self.val = HasDefault{};
    }

    receive() {
        let _ = self.val;
    }
}