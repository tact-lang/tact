struct BitsAndStrings {
    i: Int as int4;
    s: String;
}

contract CompactString {
    data: BitsAndStrings = BitsAndStrings{ i:3, s:"hi" };

    receive() {
        self.data = self.data;
    }
}