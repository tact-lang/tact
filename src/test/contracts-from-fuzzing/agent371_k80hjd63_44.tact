struct DeepWrap1 { inner: DeepWrap2; }
struct DeepWrap2 { inner: DeepWrap3; }
struct DeepWrap3 { inner: DeepWrap4; }
struct DeepWrap4 { inner: DeepWrap5; }
struct DeepWrap5 { inner: DeepWrap6; }
struct DeepWrap6 { inner: DeepWrap7; }
struct DeepWrap7 { inner: DeepWrap8; }
struct DeepWrap8 { inner: DeepWrap9; }
struct DeepWrap9 { inner: DeepWrap10; }
struct DeepWrap10 { val: Int; }

contract TestContract {
    chain: DeepWrap1;
    init() {
        self.chain = DeepWrap1{inner:DeepWrap2{inner:DeepWrap3{inner:DeepWrap4{inner:DeepWrap5{inner:DeepWrap6{inner:DeepWrap7{inner:DeepWrap8{inner:DeepWrap9{inner:DeepWrap10{val:999}}}}}}}}}};
    }
}