struct OptWrap {
    inn: Int?;
}

contract OptContract {
    data: OptWrap;

    init() {
        self.data = OptWrap{ inn: null };
    }
}