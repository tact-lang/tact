// test contract parameter syntax with nested structs
struct P1 {
    a: Int;
    b: Bool?;
}

struct P2 {
    x: P1;
    y: String?;
}

contract ParamsNested(
    param: P2,
) {
    receive() {
        // do nothing, param exists as persistent storage
    }
}