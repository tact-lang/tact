struct Params {
    count: Int;
    label: String;
    flag: Bool = false;
    info: String?;
}

contract TestContract {
    p: Params;

    init() {
        self.p = Params {
            count: 5,
            label: "label",
            info: null
        };
    }
}