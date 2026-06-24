struct Wrap1 {
    s: String;
}

struct Wrap2 {
    wrap: Wrap1;
}

contract WrappedStructs {
    data: Wrap2 = Wrap2{ wrap: Wrap1{ s: "hello" } };
}