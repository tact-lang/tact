struct Deep1 { inner: Int; }
struct Deep2 { inner: Deep1; }
struct Deep3 { inner: Deep2; }
struct Deep4 { inner: Deep3; }
struct Deep5 { inner: Deep4; }
struct Deep6 { inner: Deep5; }

contract DeepChain {
    chain: Deep6;

    init() {
        self.chain = Deep6{ inner: Deep5{ inner: Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ inner: 42 }}}}}};
    }
}