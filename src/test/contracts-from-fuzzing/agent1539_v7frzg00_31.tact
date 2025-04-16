struct OptWrap {
    a: Int?;
}
contract OptContract {
    data: OptWrap?;
    init() {
        self.data = null;
    }
}