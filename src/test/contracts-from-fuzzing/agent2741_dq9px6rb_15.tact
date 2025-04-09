struct SingleString { s: String; }

contract StringInStruct {
    val: SingleString;

    init() {
        self.val = SingleString{ s: "abcdef" };
    }
}