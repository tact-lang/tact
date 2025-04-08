// Contract parameter variant: deeply nested struct only via constructor params
struct DeepInner {
    a: Int as uint8;
    b: Bool;
}

struct DeepMiddle {
    inner: DeepInner;
    text: String;
}

contract Paramed(
    root: DeepMiddle,
    optRoot: DeepMiddle?,
)  {
    // no init(), initialized via params
}
