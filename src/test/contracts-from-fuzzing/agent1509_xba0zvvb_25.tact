struct OneOptional {
    opt: Int?;
}

contract OptDefaultMix {
    s: OneOptional;
    regular: Int = 100;

    init() {
        self.s = OneOptional{ opt: null };
    }
    receive() {
        let _ = self.regular;
    }
}