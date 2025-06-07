struct InnerString {
    text: String;
}

contract NestedStringTest {
    s: InnerString = InnerString{ text: "hello" };
}