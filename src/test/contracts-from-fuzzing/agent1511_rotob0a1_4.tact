struct LongList {
    one: Int;
    two: Bool;
    three: String;
    four: Int;
    five: Bool;
    six: String;
    seven: Int;
    eight: Bool;
    nine: String;
    ten: Int;
    eleven: Bool;
    twelve: String;
}

contract LargeStructField {
    val: LongList;

    init() {
        self.val = LongList{
            one: 1,
            two: true,
            three: "a",
            four: 2,
            five: false,
            six: "b",
            seven: 3,
            eight: true,
            nine: "c",
            ten: 4,
            eleven: false,
            twelve: "d",
        };
    }
}
