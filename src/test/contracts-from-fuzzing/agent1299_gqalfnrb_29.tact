struct Container {
    flag: Bool;
    data: Int?;
    note: String?;
}

contract MultiOptionField {
    s: Container;

    init() {
        self.s = Container{
            flag: true,
            data: null,
            note: null
        };
    }
}