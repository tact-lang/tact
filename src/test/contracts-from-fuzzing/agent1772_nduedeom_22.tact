struct NestDefault {
    val1: Int = 7;
    val2: Bool = true;
}

contract DefaultedNested {
    mydata: NestDefault;

    init() {
        self.mydata = NestDefault{};
    }
}