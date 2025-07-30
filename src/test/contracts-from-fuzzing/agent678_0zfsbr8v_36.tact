struct Inner {
    f: Int as uint8;
    opt: Bool?;
}

struct Middle {
    nested: Inner?;
}

contract ComboParam(
    arg: Middle?
) {}
