struct SN1 { a:Int }
struct SN2 { b:SN1 }
struct SN3 { c:SN2 }
struct SN4 { d:SN3 }

contract VeryDeep {
    chain: SN4;

    init() {
        self.chain = SN4{ d: SN3{ c: SN2{ b: SN1{ a:1 } } } };
    }
}
