struct L1 { v: Int }
struct L2 { inner: L1 }
struct L3 { inner: L2 }
struct L4 { inner: L3 }
struct L5 { inner: L4 }
struct L6 { inner: L5 }

contract Deep6 {
    f: L6;

    init() {
        self.f = L6{ inner: L5{ inner: L4{ inner: L3{ inner: L2{ inner: L1{ v: 101 }}}}}};
    }
}
