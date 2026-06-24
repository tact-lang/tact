struct SOptNum {
    x: Int?;
}

contract OptNumDirect {
    data: SOptNum;

    init() {
        self.data = SOptNum{};
    }

    receive() {
        let _ = self.data;
    }
}