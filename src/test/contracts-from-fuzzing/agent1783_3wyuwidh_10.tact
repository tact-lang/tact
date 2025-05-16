struct StringOptions {
    name: String;
    nickname: String?;
}

contract StructStringOpts {
    info: StringOptions;
    init() {
        self.info = StringOptions{
            name: "Name",
            nickname: null,
        };
    }
}