struct Inn {
    foo: Int;
}

contract Test(
    bar: Inn
) {}

// try to use wrong init type
// will be passed on deploy; nothing declared yet purposely