struct OneLargeString {
    s: String;
}

contract LargeStringTest {
    val: OneLargeString;
    
    init() {
        self.val = OneLargeString{ s: "This is a long test string to check large string constants serialization" };
    }
}