trait MyTrait {
    shared: Int;
}

contract TestContract with MyTrait {
    shared: Int;

    init() {
        self.shared = 123;
    }

    receive() {
        let _ = self.shared;
    }
}