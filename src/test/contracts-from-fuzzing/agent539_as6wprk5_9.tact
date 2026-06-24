struct SN0 { a: Int }
struct SN1 { a: SN0 }
struct SN2 { a: SN1 }
struct SN3 { a: SN2 }
struct SN4 { a: SN3 }
struct SN5 { a: SN4 }
struct SN6 { a: SN5 }
struct SN7 { a: SN6 }

contract ChainDepth {
    data: SN7;
    init() {
        self.data = SN7{ a: SN6{ a: SN5{ a: SN4{ a: SN3{ a: SN2{ a: SN1{ a: SN0{ a: 777 } } } } } } } };
    }
}