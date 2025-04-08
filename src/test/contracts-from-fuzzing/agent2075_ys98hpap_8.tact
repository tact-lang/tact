struct CustomFmt {
    small: Int as uint4;
    big: Int as int128;
    yes: Bool;
}

contract SerialFormats {
    store: CustomFmt;

    init() {
        self.store = CustomFmt{
            small: 3,
            big: 123456789,
            yes: true
        };
    }
}