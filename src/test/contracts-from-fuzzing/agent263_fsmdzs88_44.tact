struct SDeep1 { val: Int }
struct SDeep2 { inner: SDeep1 }
struct SDeep3 { inner: SDeep2 }
struct SDeep4 { inner: SDeep3 }
struct SDeep5 { inner: SDeep4 }
struct SDeep6 { inner: SDeep5 }
struct SDeep7 { inner: SDeep6 }
struct SDeep8 { inner: SDeep7 }

contract DeepEight {
    d: SDeep8;

    init() {
        self.d = SDeep8{inner:SDeep7{inner:SDeep6{inner:SDeep5{inner:SDeep4{inner:SDeep3{inner:SDeep2{inner:SDeep1{val:888}}}}}}}};
    }
}