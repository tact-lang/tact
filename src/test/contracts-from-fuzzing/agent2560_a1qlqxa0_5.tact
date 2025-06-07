struct IntAndString {
    big_int: Int as int257;
    med_int: Int as int128;
    small_int: Int as int8;
    text: String;
}

contract TestContract {
    data: IntAndString;

    init() {
        self.data = IntAndString{
            big_int: 1,
            med_int: 2,
            small_int: 3,
            text: "hi",
        };
    }
}