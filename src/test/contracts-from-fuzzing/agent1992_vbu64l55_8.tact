struct Info {
    name: String = "default";
    nr: Int?;
}

struct Holder {
    id: Int = 999;
    infoOpt: Info?;
}

contract Test {
    data: Holder;

    init() {
        self.data = Holder{
            id: 1,
            infoOpt: null
        };
    }
}