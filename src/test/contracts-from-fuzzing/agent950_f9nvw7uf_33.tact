// deeply nested optional struct chain as contract parameter
struct X1 { next: X2?; val: Int?; }
struct X2 { next: X3?; val: Int?; }
struct X3 { next: X4?; val: Int?; }
struct X4 { val: Int?; }

contract LongParamChain(
    top: X1?
) {}