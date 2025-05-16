// deeply nested optional Address inside structs
struct AddrLeaf { a: Address? }
struct AddrMid { leaf: AddrLeaf? }
struct AddrRoot { mid: AddrMid? }

contract NestedOptionalAddress {
    state: AddrRoot;

    init() {
        self.state = AddrRoot{mid:null};
    }
}