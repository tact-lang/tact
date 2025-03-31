/*
   Comprehensive fuzz testing of maps in Tact: key/value types, methods, and edge cases.
   This test file is intended to validate that maps strictly follow the documentation regarding:
   - Allowed key types (only Int and Address are allowed)
   - Allowed value types (Int, Bool, Cell, Address, Struct, Message) with map-specific serialization support
   - Map operations: set/get, deletion via replace with null, exists/isEmpty checks,
     replace/replcaeGet, iteration via foreach, deep equality checks, and conversion to Cell via asCell().

   Documentation references:
   - Allowed types and serialization are detailed in [docs_book_maps.md  ].
   - Iteration and foreach rules are explained in [docs_book_statements.md  ].
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

// Test C: Nested maps using allowed types
struct AllowanceMap { unbox: map<Address, Int> }
contract NestedMaps {
    // Based on documentation example of nested maps [docs_book_maps.md  ].
    get fun test(addr: Address): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let inner: map<Address, Int> = emptyMap();
        inner.set(addr, 42);
        let am: AllowanceMap = AllowanceMap{ unbox: inner };
        allowances.set(addr, am);
        return allowances.get(addr)!!.unbox.get(addr)!!;
    }
}

// Test D: Map serialization using fixed-width unsigned integer conversion for keys and values
struct SerializedMapInside {
    countersButCompact: map<Int as uint8, Int as uint8>;
}
fun testD(): Int {
    let m: map<Int as uint8, Int as uint8> = emptyMap();
    m.set(10, 20);
    return m.get(10)!!;
}

// Test E: Deletion via replace with null assignment
fun testE(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 42);
    let _ = m.replace(1, null); // as documented, using null deletes the key [docs_book_maps.md  ].
    if (m.get(1) != null) {
        return -1;
    } else {
        return 0;
    }
}

// Test F: .exists() and .isEmpty() methods
fun testF(): Int {
    let m: map<Int, Int> = emptyMap();
    if (!m.isEmpty()) { return -1; }
    m.set(2, 100);
    if (!m.exists(2)) { return -2; }
    return m.get(2)!!;
}

// Test G: .replace() and .replaceGet()
fun testG(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(3, 300);
    let old = m.replaceGet(3, 350);
    if (old != 300) { return -1; }
    return m.get(3)!!;
}

// Test H: Iteration over map using foreach to sum values [docs_book_statements.md  ]
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

// Test I: Deep equality versus shallow equality
fun testI(): Int {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 2);
    m2.set(1, 2);
    // According to docs, deepEquals compares map entries while shallow equality (==) compares serialization [docs_book_maps.md  ]
    if (!m1.deepEquals(m2)) { return -1; }
    if (m1 != m2) { return -2; }
    return 0;
}

// Test J: Conversion to a Cell as per .asCell() method
contract TestAsCell {
    stored: map<Int, Int>;

    init() {
        self.stored = emptyMap();
    }

    receive() {
        self.stored.set(1, 111);
        let cellOpt: Cell? = self.stored.asCell();
        if (cellOpt == null) {
            dump("asCell returned null");
        } else {
            dump("asCell returned a valid cell");
        }
    }
}

/*
   Negative tests (expected compile-time errors):

   Below are examples that intentionally violate the Tact map type restrictions per documentation [docs_book_maps.md  ]:

   // Invalid key type Bool: Only Int and Address are allowed as keys
   fun invalidKeyBool(): Int {
       let m: map<Bool, Int> = emptyMap();
       m.set(true, 1);
       return 0;
   }

   // Invalid key type using a Struct
   struct MyStruct { a: Int; }
   fun invalidKeyStruct(): Int {
       let m: map<MyStruct, Int> = emptyMap();
       m.set(MyStruct{ a: 7 }, 1);
       return 0;
   }

   // Attempting to use variable-width serialization (varint) for map keys should also fail
   fun invalidKeyVarint(): Int {
       let m: map<Int as varint, Int> = emptyMap();
       m.set(100, 200);
       return m.get(100)!!;
   }

   These negative tests are expected to be rejected by the compiler and align with what the documentation specifies.
*/
