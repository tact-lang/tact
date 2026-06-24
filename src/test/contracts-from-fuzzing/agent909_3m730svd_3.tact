struct Strict {
    small: Int as uint4;
    big: Int as int128;
    flag: Bool;
}

contract SerializedStorage {
    data: Strict;

    init() {
        self.data = Strict{
            small: 5,
            big: -42,
            flag: true,
        };
    }
}