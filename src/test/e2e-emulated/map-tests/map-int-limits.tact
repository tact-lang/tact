struct Map {
    // various key lengths
    _1: map<Int as uint1, Bool>;
    _2: map<Int as uint8, Bool>;
    _3: map<Int as uint32, Bool>;
    _4: map<Int as uint142, Bool>;
    _5: map<Int as uint256, Bool>;
    _6: map<Int as int2, Bool>;
    _7: map<Int as int10, Bool>;
    _8: map<Int as int37, Bool>;
    _9: map<Int as int256, Bool>;
    _10: map<Int as int257, Bool>;

    // various value formats
    _11: map<Int as uint4, Int as uint1>;
    _12: map<Int as uint4, Int as uint8>;
    _13: map<Int as uint4, Int as uint32>;
    _14: map<Int as uint4, Int as uint142>;
    _15: map<Int as uint4, Int as uint256>;
    _16: map<Int as uint4, Int as int2>;
    _17: map<Int as uint4, Int as int10>;
    _18: map<Int as uint4, Int as int37>;
    _19: map<Int as uint4, Int as int256>;
    _21: map<Int as uint4, Int as int257>;
    _22: map<Int as uint4, Int as coins>;
    _23: map<Int as uint4, Int as varuint16>;
    _24: map<Int as uint4, Int as varuint32>;
    _25: map<Int as uint4, Int as varint16>;
    _26: map<Int as uint4, Int as varint32>;
}

 // -pow(2, 256)
const MIN_INT257: Int = -115792089237316195423570985008687907853269984665640564039457584007913129639936;
// pow(2, 256) - 1
const MAX_INT257: Int = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

contract MapIntLimitTester {
    const ExitCodeTooLargeNum: Int = 1024;
    const ExitCodeTooSmallNum: Int = 1025;

    // Property: m.set(key.min, v).set(key.max, v) does not throw
    get fun testSetKeyMinAndMaxDoesNotThrow(key: KeyData, val: ValData): Bool {
        let m = doubletonMap(key, val);
        return
            true;
    }

    // Property: max(Int as KEY_SIZE) < MAX_INT257 => m.get(max + 1) == null
    // no exception occurs
    get fun testGetGreaterThanMax(key: KeyData, val: ValData): Bool {
        nativeThrowUnless(self.ExitCodeTooLargeNum, key.max < MAX_INT257);
        let m = doubletonMap(key, val);
        return
            m.get(key.max + 1) == null
    }

    // Property: min(Int as KEY_SIZE) > MIN_INT257 => m.get(min - 1) == null
    // no exception occurs
    get fun testGetSmallerThanMin(key: KeyData, val: ValData): Bool {
        nativeThrowUnless(self.ExitCodeTooSmallNum, key.min > MIN_INT257);
        let m = doubletonMap(key, val);
        return
            m.get(key.min - 1) == null
    }

    // Property: max(Int as KEY_SIZE) < MAX_INT257 => m.set(max + 1, 0) should result in exit code 5
    get fun testSetKeyGreaterThanMax(key: KeyData, val: ValData): Bool {
        nativeThrowUnless(self.ExitCodeTooLargeNum, key.max < MAX_INT257);
        let m = doubletonMap(key, val);
        m.set(key.max + 1, 0); // exit code 5
        return
            false; // unreachable
    }

    // Property: min(Int as KEY_SIZE) > MIN_INT257 => m.set(min - 1, 0) should result in exit code 5
    get fun testSetKeySmallerThanMin(key: KeyData, val: ValData): Bool {
        nativeThrowUnless(self.ExitCodeTooSmallNum, key.min > MIN_INT257);
        let m = doubletonMap(key, val);
        m.set(key.min - 1, 0); // exit code 5
        return
            false; // unreachable
    }

    // Property: max(Int as VAL_SIZE) < MAX_INT257 => m.set(0, max + 1) should result in exit code 5
    get fun testSetValGreaterThanMax(key: KeyData, val: ValData): Bool {
        nativeThrowUnless(self.ExitCodeTooLargeNum, key.max < MAX_INT257);
        let m = doubletonMap(key, val);
        m.set(0, val.max + 1); // exit code 5
        return
            false; // unreachable
    }

    // Property: min(Int as VAL_SIZE) > MIN_INT257 => m.set(0, min - 1) should result in exit code 5
    get fun testSetValSmallerThanMin(key: KeyData, val: ValData): Bool {
        nativeThrowUnless(self.ExitCodeTooSmallNum, key.min > MIN_INT257);
        let m = doubletonMap(key, val);
        m.set(0, val.min - 1); // exit code 5
        return
            false; // unreachable
    }

    // TODO: cover
    // - exists
    // - replace
    // - replaceGet
    // - `foreach`?
}