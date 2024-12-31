struct KeyData {
    min: Int as KEY_SIZE;
    max: Int as KEY_SIZE;
}

struct ValData {
    min: Int as VAL_SIZE;
    max: Int as VAL_SIZE;
}

 // -pow(2, 256)
const MIN_INT257: Int = -115792089237316195423570985008687907853269984665640564039457584007913129639936;
// pow(2, 256) - 1
const MAX_INT257: Int = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

fun singletonMap1(key: KeyData, val: ValData): map<Int as KEY_SIZE, Int as VAL_SIZE> {
    let m: map<Int as KEY_SIZE, Int as VAL_SIZE> = emptyMap();
    m.set(key.min, val.min);
    return m;
}

fun singletonMap2(key: KeyData, val: ValData): map<Int as KEY_SIZE, Int as VAL_SIZE> {
    let m: map<Int as KEY_SIZE, Int as VAL_SIZE> = emptyMap();
    m.set(key.max, val.max);
    return m;
}

// assumption: key.min != key.max
fun doubletonMap(key: KeyData, val: ValData): map<Int as KEY_SIZE, Int as VAL_SIZE> {
    let m: map<Int as KEY_SIZE, Int as VAL_SIZE> = emptyMap();
    m.set(key.min, val.min);
    m.set(key.max, val.max);
    return m;
}

contract MapIntLimitTester {
    const ExitCodeTooLargeNum: Int = 1024;
    const ExitCodeTooSmallNum: Int = 1025;

    // Property: m.set(key.min, val.min).set(key.max, val.max) does not throw
    get fun testSetKeyAndValMinAndMax(key: KeyData, val: ValData): Bool {
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