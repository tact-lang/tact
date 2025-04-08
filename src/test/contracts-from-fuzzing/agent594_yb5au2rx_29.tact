struct Inner {
    text: String;
}

contract StringStructContract {
    inner: Inner = Inner{ text: "Hello" };
}