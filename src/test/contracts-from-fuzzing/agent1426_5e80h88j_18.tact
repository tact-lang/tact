struct SerializationCheck {
    small: Int as uint4;
    mid: Int as int128;
    big: Int as int257;
}

contract SerializationContract {
    val: SerializationCheck;

    init() {
        self.val = SerializationCheck{
            small: 5,
            mid: -100,
            big: 1000000000000000000000
        };
    }
}