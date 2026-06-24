struct Strings {
    plain: String;
    opt: String?;
}

contract StringStructInStorage {
    st: Strings;

    init() {
        self.st = Strings{
            plain: "abc",
            opt: null,
        };
    }
}