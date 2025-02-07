contract AsmFunctionsTester {
    /// To handle deployment
    receive() {}

    get fun testAsmStoreDict(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(35, 34);
        m.set(42, 27);

        let s = beginCell().asmStoreDict(m.asCell()).asSlice();
        let m2: map<Int, Int> = s.asmLoadMapIntInt().val;

        return m2 == m;
    }

    get fun testAsmLoadCoins(): Bool {
        let s = beginCell().storeCoins(42).asSlice();
        return s.asmLoadCoins().val == 42;
    }

    get fun testAsmLoadCoinsMut(): Bool {
        let s = beginCell().storeCoins(42).asSlice();
        return s.asmLoadCoinsMut() == 42 && s.empty();
    }

    // asmLoadCoinsMut(), but with data supplied at runtime
    get fun testAsmLoadCoinsMutRuntime(c: Cell): Int {
        let s = c.asSlice();
        let res = s.asmLoadCoinsMut();
        s.endParse(); // like .empty(), but throws on failure
        return res;
    }

    get fun testAsmLoadInt(): Bool {
        let s = beginCell().storeInt(42, 7).asSlice();
        return s.asmLoadInt(7).val == 42;
    }

    get fun testAsmDebugStr(): Bool {
        // TODO: Enable after proper ASM functions parser
        // asmDebugStr();
        return true;
    }

    get fun testAsmCreateUseWord(): Bool {
        return asmCreateUseWord(6) == 7;
    }

    get fun testAsmSecondToLast(): Bool {
        return asmSecondToLast(Two{ a: 1, b: 2 }, Two{ a: 3, b: 4 }) == 3;
    }

    // asmSecondToLast(), but with data supplied at runtime
    get fun testAsmSecondToLastRuntime(s1: Two, s2: Two): Int {
        return asmSecondToLast(s1, s2);
    }

    get fun testAsmFirst(): Bool {
        return asmFirst(
            TwoInTwo{ a: Two{ a: 1, b: 2}, b: Two{ a: 3, b: 4 } },
            TwoInTwo{ a: Two{ a: 5, b: 6}, b: Two{ a: 7, b: 8 } },
            TwoInTwo{ a: Two{ a: 9, b: 10}, b: Two{ a: 11, b: 12 } },
        ) == 1;
    }

    // asmFirst(), but with data supplied at runtime
    get fun testAsmFirstRuntime(s1: TwoInTwo, s2: TwoInTwo, s3: TwoInTwo): Int {
        return asmFirst(s1, s2, s3);
    }
}

// Functions to test

asm(c self) extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT }

asm extends fun asmLoadMapIntInt(self: Slice): MapIntIntSlice { LDDICT }

asm extends fun asmLoadCoins(self: Slice): IntSlice { LDVARUINT16 }

asm(-> 1 0) extends mutates fun asmLoadCoinsMut(self: Slice): Int { LDVARUINT16 }

asm(self len -> 1 0) extends fun asmLoadInt(self: Slice, len: Int): SliceInt { LDIX }

asm(b a) fun asmSecondToLast(a: Two, b: Two): Int { DROP DROP DROP }

asm(a c b) fun asmFirst(a: TwoInTwo, b: TwoInTwo, c: TwoInTwo): Int { DROP2 DROP2 DROP2 DROP2 DROP2 DROP }

// TODO: Enable after proper ASM functions parser
// asm fun asmDebugStr() { "Works!" DEBUGSTR }

asm fun asmCreateUseWord(x: Int): Int {
    { INC INC INC } : 🥰🥰🥰
    { DEC DEC DEC } : 💀💀💀
    🥰🥰🥰 💀💀💀 INC
}

// Helper Structs

struct MapIntIntSlice {
    val: map<Int, Int>;
    rem: Slice;
}

struct IntSlice {
    val: Int;
    rem: Slice;
}

struct SliceInt {
    rem: Slice;
    val: Int;
}

struct Two {
    a: Int;
    b: Int;
}

struct TwoInTwo {
    a: Two;
    b: Two;
}
