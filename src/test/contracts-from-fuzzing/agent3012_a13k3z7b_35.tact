// Very deep nested struct chain with mixed defaulted opt types
struct D4 { val: Int?; }
struct D3 { val: D4; }
struct D2 { val: D3; }
struct D1 { val: D2; }

contract DeepMixedOpt {
    data: D1;

    init() {
        self.data = D1{ val:D2{val:D3{val:D4{val:null}}}};
    }
}