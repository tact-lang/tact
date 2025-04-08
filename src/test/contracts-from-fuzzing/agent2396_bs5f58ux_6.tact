struct Flat {
    i: Int;
    b: Bool;
    s: String;
}

contract NoInitDefaults {
    data: Flat;

    init() {
        self.data = Flat{
            i: 0,
            b: false,
            s: ""
        };
    }
}
