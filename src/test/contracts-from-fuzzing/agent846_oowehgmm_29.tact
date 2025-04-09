// Large multi-layer struct nesting different types
struct Layer3 {
    addr: Address;
    flag: Bool;
    num: Int;
}

struct Layer2 {
    inner: Layer3;
    opt: Int?;
}

struct Layer1 {
    l2: Layer2;
    b: Bool;
}

contract Test {
    val: Layer1;

    init() {
        self.val = Layer1 {
            l2: Layer2 {
                inner: Layer3{ addr: myAddress(), flag: true, num: -123 },
                opt: null
            },
            b: false
        };
    }
}