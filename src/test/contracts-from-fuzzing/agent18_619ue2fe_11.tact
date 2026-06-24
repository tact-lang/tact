struct SliceInt { s: Slice; val: Int }

asm(-> 1 0) extends fun asmLoadCoins(self: Slice): SliceInt { LDVARUINT16 }

contract TestAsm {
    receive() {
        let b = beginCell().storeCoins(42);
        let s = b.asSlice();
        let si: SliceInt = s.asmLoadCoins();
        dump(si.val);
    }
}
