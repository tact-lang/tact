struct OptionalLayer {
    name: String?;
    flag: Bool?;
    count: Int?;
}

contract OptContract {
    opt: OptionalLayer;

    init() {
        self.opt = OptionalLayer{
            name: null,
            flag: true,
            count: null,
        };
    }
}
