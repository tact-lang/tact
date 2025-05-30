// Deep optional chain in struct
struct OpChain {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

struct Wrap1 {
    next: OpChain;
}

struct Wrap2 {
    next: Wrap1;
}

contract DeepOptional {
    inner: Wrap2;

    init() {
        self.inner = Wrap2{
            next: Wrap1{
                next: OpChain{
                    a: null,
                    b: null,
                    c: null,
                    d: null,
                    e: null,
                    f: null
                }
            }
        };
    }
}