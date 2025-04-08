struct OneOptional {
    innerOpt: Int?;
}

contract OptInStructPersistent {
    data: OneOptional?;
    init() {
        self.data = null;
    }
    receive() {
        if (self.data != null) {
            let _ = self.data!!;
        }
    }
}