contract OptToReqOk {
    x: Int;

    init() {
        let o: Int? = 10;
        self.x = o!!;
    }
}