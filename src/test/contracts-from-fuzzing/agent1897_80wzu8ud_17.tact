struct SerializeFormats {
    big: Int as int257;
    small: Int as int8;
    medium: Int as uint32;
    flag: Bool;
    maybeVal: Int?;
}

contract SerializeFormatsContract {
    field: SerializeFormats;

    init() {
        self.field = SerializeFormats{
            big: 1000000,
            small: 5,
            medium: 4242,
            flag: true,
            maybeVal: null
        };
    }
}
