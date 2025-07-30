// nested optional chain with empty string and bool optionals on param
struct ChainA { inner: ChainB?; s: String?; }
struct ChainB { inner: ChainC?; b: Bool?; }
struct ChainC { v: Int?; }

contract ParamBigChain(
    top: ChainA?
) {}