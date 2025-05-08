struct Chain3 { c: Int; }
struct Chain2 { next: Chain3; val: Int?; }
struct Chain1 { next: Chain2; s: String?; }

contract Chain {
    root: Chain1 = Chain1{
        next: Chain2{ next: Chain3{ c: 10 }, val: null },
        s: null
    };
}
