/*
   Comprehensive fuzz testing of maps in Tact avoiding known issues with invalid key types.
   This snippet includes tests for valid operations with maps, including basic get/set,
   nested maps, serialization directives, deletion, existence check, replace/replaceGet,
   iteration using foreach, deepEquals and asCell conversion.
*/

// Test A: Basic usage with allowed key type Int
fun testA(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 42);
    return m.get(1)!!;
}

// Test B: Valid map using Address as key type
fun testB(addr: Address): Int {
    let m: map<Address, Int> = emptyMap();
    m.set(addr, 100);
    return m.get(addr)!!;
}

// Test C: Nested maps using allowed types. Uses a struct (AllowanceMap) containing a map<Address, Int>
struct AllowanceMap { unbox: map<Address, Int> }
contract NestedMaps {
    // Inspired by documentation example for nested maps
    get fun test(addr: Address): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let inner: map<Address, Int> = emptyMap();
        inner.set(addr, 42);
        let am: AllowanceMap = AllowanceMap{ unbox: inner };
        allowances.set(addr, am);
        return allowances.get(addr)!!.unbox.get(addr)!!;
    }
}

// Test D: Map with serialization of keys and values using fixed-width unsigned integer formats
struct SerializedMapInside {
    countersButCompact: map<Int as uint8, Int as uint8>;
}
fun testD(): Int {
    let m: map<Int as uint8, Int as uint8> = emptyMap();
    m.set(10, 20);
    return m.get(10)!!;
}

// Test E: Testing deletion via replace with null assignment
fun testE(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 42);
    let _ = m.replace(1, null); // should delete key 1
    if (m.get(1) != null) {
        return -1;
    } else {
        return 0;
    }
}

// Test F: Testing .exists() and .isEmpty() methods on maps
fun testF(): Int {
    let m: map<Int, Int> = emptyMap();
    if (!m.isEmpty()) { return -1; }
    m.set(2, 100);
    if (!m.exists(2)) { return -2; }
    return m.get(2)!!;
}

// Test G: Testing .replace() and .replaceGet() methods on maps
fun testG(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(3, 300);
    let old = m.replaceGet(3, 350);
    if (old != 300) { return -1; }
    return m.get(3)!!;
}

// Test H: Iterating over a map using foreach and summing up values
fun testH(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    let sum0: Int = 0;
    foreach (k, v in m) {
        sum0 = sum0 + v;
    }
    return sum0;
}

// Test I: Testing .deepEquals() vs shallow equality operator
fun testI(): Int {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 2);
    m2.set(1, 2);
    // deepEquals should return true, and shallow equality (==) returns true as well
    if (!m1.deepEquals(m2)) { return -1; }
    if (m1 != m2) { return -2; }
    return 0;
}

// Test J: Testing conversion to a Cell using asCell()
contract TestAsCell {
    // Persistent state variable declared as a field
    stored: map<Int, Int>;

    // Initialization function for the contract
    init() {
        self.stored = emptyMap();
    }

    receive() {
        // Set a value in the persistent state map
        self.stored.set(1, 111);
        // Convert to cell; if the map is empty, asCell returns null, but here it should succeed
        let cellOpt: Cell? = self.stored.asCell();
        if (cellOpt == null) {
            dump("asCell returned null");
        } else {
            dump("asCell returned a valid cell");
        }
    }
}
