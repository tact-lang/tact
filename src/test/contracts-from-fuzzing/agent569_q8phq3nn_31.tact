struct Inner {
    x: Int?;
    y: Bool?;
}

struct Middle {
    i: Inner;
    s: String?;
}

struct Top {
    m: Middle;
    flag: Bool;
}

contract TestContract(
    deepOpt: Top?,
    count: Int
) {
    receive() {
        // do nothing
    }
}