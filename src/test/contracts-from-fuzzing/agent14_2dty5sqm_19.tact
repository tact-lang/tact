struct NegativeKeysResult {
    neg1: Int?;
    neg2: Int?;
}

contract TestMapNegativeKeys {
    m: map<Int, Int> = emptyMap();

    init() {
         // Insert keys with negative integers
         self.m.set(-1, -100);
         self.m.set(-123456, 654321);
    }

    // Getter to retrieve values for negative keys using a struct, since tuple returns are not supported
    get fun test(): NegativeKeysResult {
         return NegativeKeysResult{
             neg1: self.m.get(-1),
             neg2: self.m.get(-123456)
         };
    }
}
