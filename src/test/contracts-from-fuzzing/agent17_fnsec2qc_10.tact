struct SliceInt { s: Slice; val: Int }

asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

contract ArrTest {
    stored: Int;

    init() {
         let b = beginCell().storeInt(42, 32);
         let s = b.asSlice();
         let si: SliceInt = asmLoadInt(32, s);
         self.stored = si.val;
    }

    get fun getStored(): Int {
         return self.stored;
    }
}
