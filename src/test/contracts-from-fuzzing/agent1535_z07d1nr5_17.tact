struct InnerStr {
    s: String;
}

struct MidStr {
    inner: InnerStr;
}

struct OuterStr {
    nested: MidStr;
}

contract DeepLargeStr {
    data: OuterStr = OuterStr {
        nested: MidStr{
            inner: InnerStr{
                s: "This is a long string embedded very deep in a persistent nested struct. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            }
        }
    };
}
