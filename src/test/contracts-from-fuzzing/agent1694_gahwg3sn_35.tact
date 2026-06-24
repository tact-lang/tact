struct Chain1 { x: Int }
struct Chain2 { c2: Chain1 }
struct Chain3 { c3: Chain2 }
struct Chain4 { c4: Chain3 }
struct Chain5 { c5: Chain4 }
struct Chain6 { c6: Chain5 }
struct Chain7 { c7: Chain6 }
struct Chain8 { c8: Chain7 }
struct Chain9 { c9: Chain8 }
struct Chain10 { c10: Chain9 }
struct Chain11 { c11: Chain10 }
struct Chain12 { c12: Chain11 }

contract DeepNest12 {
    deep: Chain12;

    init() {
        self.deep = Chain12{ c12: Chain11{ c11: Chain10{ c10: Chain9{ c9: Chain8{ c8: Chain7{ c7: Chain6{ c6: Chain5{ c5: Chain4{ c4: Chain3{ c3: Chain2{ c2: Chain1{ x: 77 } } } } } } } } } } } };
    }
}