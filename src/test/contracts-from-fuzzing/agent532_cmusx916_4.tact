struct ManyOptions {
    num1: Int?;
    num2: Int?;
    flag1: Bool?;
    flag2: Bool?;
    text: String?;
}

contract OptContract {
    storage: ManyOptions;

    init() {
        self.storage = ManyOptions{
            num1: null,
            num2: 123,
            flag1: true,
            flag2: null,
            text: null
        };
    }
}