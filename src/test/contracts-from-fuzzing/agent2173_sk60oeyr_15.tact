struct LongString {
    s: String;
}

contract LongStrTest {
    data: LongString;
    init() {
        self.data = LongString{ s: "Lorem ipsum dolor sit amet, consectetur adipiscing elit" };
    }
}