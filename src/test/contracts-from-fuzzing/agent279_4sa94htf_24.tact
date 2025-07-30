struct DeeplyO {
    inn: String?;
    val: Int?
}

contract MultiOptNested {
    d1: DeeplyO?;
    d2: DeeplyO?;

    init() {
        self.d1 = null;
        self.d2 = null;
    }
}