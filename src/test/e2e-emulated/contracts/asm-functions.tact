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

    get fun testAsmLoadInt(): Bool {
        let s = beginCell().storeInt(42, 7).asSlice();
        return s.asmLoadInt(7).val == 42;
    }

    get fun testAsmDebugStr(): Bool {
        asmDebugStr();
        return true;
    }

    get fun testAsmCreateUseWord(): Bool {
        return asmCreateUseWord(6) == 7;
    }
}

// Functions to test

asm(c self) extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT }

asm extends fun asmLoadMapIntInt(self: Slice): MapIntIntSlice { LDDICT }

asm extends fun asmLoadCoins(self: Slice): IntSlice { LDVARUINT16 }

asm(self len -> 1 0) extends fun asmLoadInt(self: Slice, len: Int): SliceInt { LDIX }

asm fun asmDebugStr() { "Works!" DEBUGSTR }

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
