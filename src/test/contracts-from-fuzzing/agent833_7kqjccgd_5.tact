struct StringHolder {
    text: String;
    note: String?;
    flag: Bool;
}

contract StorageString {
    s: StringHolder;

    init() {
        self.s = StringHolder{
            text: "persistent",
            note: null,
            flag: true,
        };
    }
}