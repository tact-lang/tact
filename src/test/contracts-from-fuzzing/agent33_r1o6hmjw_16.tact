struct S { x: Int }

contract TestGetterNested2 {
    get fun getS(a: Int): S {
         if (a > 0) {
             if (a > 10) { return S { x: a }; }
             return S { x: a + 1 };
         } else {
             return S { x: 0 };
         }
    }
}
