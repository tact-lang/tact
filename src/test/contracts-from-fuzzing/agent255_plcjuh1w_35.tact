struct OptWrap1 {
    x: Int?;
}
struct OptWrap2 {
    y: OptWrap1?;
}

contract MultipleWraps {
    state: OptWrap2?;

    init() {
        self.state = null;
    }
}