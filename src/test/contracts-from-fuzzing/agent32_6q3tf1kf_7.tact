struct InnerComplex {
    A: Int; // using capitalized to match Tact naming
    B: Int;
    C: Int?;
}

struct ComplexNested {
    inner: InnerComplex;
    mapping: map<Int, InnerComplex>;
    flag: Bool?;
}

contract TestDeepComplex {
    receive() {
         let ic: InnerComplex = InnerComplex{ A: 5, B: 10, C: null };
         let cn: ComplexNested = ComplexNested{
             inner: ic,
             mapping: emptyMap(),
             flag: null
         };
         // Access fields to ensure full compilation
         let result: Int = cn.inner.A + cn.inner.B;
         result;
    }
}
