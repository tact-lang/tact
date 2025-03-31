/// Fuzz-testing for Tact Maps - Valid Test Cases

// Test 1: Basic Map Operations - valid key/value operations
contract TestMapBasic {
    // Allowed key: Int; Allowed value: Int
    get fun run() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 20);
        return m.get(10)!!; // expected: 20
    }
}

// Test 3: Map Operations: exists, isEmpty, replace, replaceGet, and deletion via del()
contract TestMapOps {
    get fun run() : Int {
        let m: map<Int, Int> = emptyMap();
        // Set a value
        m.set(100, 200);
        // Validate get
        let v: Int = m.get(100)!!; // should be 200

        // exists tests using ternary operator
        let exists100: Int = m.exists(100) ? 1 : 0;  // expected 1
        let exists101: Int = m.exists(101) ? 1 : 0;  // expected 0

        // isEmpty test (should be false, thus 0)
        let emptyFlag: Int = m.isEmpty() ? 1 : 0;     // expected 0

        // replace test: change 100's value to 250
        let rep: Bool = m.replace(100, 250);
        let repFlag: Int = rep ? 1 : 0;               // expected 1
        let newVal: Int = m.get(100)!!;               // expected 250

        // replace with null: deletion of key 100
        let repDel: Bool = m.replace(100, null);
        let repDelFlag: Int = repDel ? 10 : 0;         // expected 10

        // Test replaceGet on an existing key
        m.set(200, 300);
        let oldVal: Int = m.replaceGet(200, 350)!!;    // returns 300
        let noneVal = m.replaceGet(300, 400);         // returns null since key 300 doesn't exist

        // Test deletion using .del()
        m.set(400, 500);
        let delOk: Bool = m.del(400);
        let delOkVal: Int = delOk ? 1000 : 0;         // expected 1000
        let delAgain: Bool = m.del(400);
        let delAgainVal: Int = delAgain ? 100 : 0;      // expected 0

        // Compose a deterministic result
        // newVal=250, exists100=1, exists101=0, repFlag=1, repDelFlag=10, oldVal=300, delOkVal=1000, delAgainVal=0
        // Computed as: 250 + (1*1000) + (0*100) + 1 + 10 + 300 + 1000 + 0 = 2561
        return newVal + exists100 * 1000 + exists101 * 100 + repFlag + repDelFlag + oldVal + delOkVal + delAgainVal;
    }
}

// Test 4: Nested Maps using a struct wrapper
struct InnerMapWrapper {
    inner: map<Int, Int>
}

contract ValidNestedMaps {
    get fun run() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(111, 222);
        let wrapper = InnerMapWrapper { inner: m };
        let outer: map<Address, InnerMapWrapper> = emptyMap();
        outer.set(myAddress(), wrapper);
        return outer.get(myAddress())!!.inner.get(111)!!; // expected: 222
    }
}

// Test 5: Map Serialization with fixed-width integers
struct SerializedMapInside {
    // Both keys and values are serialized as 8-bit unsigned integers
    countersButCompact: map<Int as uint8, Int as uint8>
}

contract TestSerialization {
    get fun run() : Int {
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        m.set(42, 99);
        return m.get(42)!!; // expected: 99
    }
}

// Test 6: Iteration Over Map
contract TestIteration {
    get fun run() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         let s: Int = 0;
         // Iteration order is from smallest key upward
         foreach (k, v in m) {
             s += k + v;  // (1+10) + (2+20) = 11 + 22 = 33
         }
         return s; // expected: 33
    }
}

// Test 7: Map Equality: shallow (==) vs deepEquals()
contract TestEquality {
    get fun run() : Int {
         let a: map<Int, Int> = emptyMap();
         let b: map<Int, Int> = emptyMap();
         a.set(3, 33);
         b.set(3, 33);
         let eq1: Int = (a == b) ? 100 : 0;         // shallow equality check
         let eq2: Int = (a.deepEquals(b)) ? 1000 : 0; // deep equality check
         return eq1 + eq2; // if both true, expected: 1100
    }
}

// Test 8: Converting a Map to a Cell using .asCell()
contract TestAsCell {
    get fun run() : Int {
        let m: map<Int, Int> = emptyMap();
        // asCell() returns null for an empty map
        let c1: Cell? = m.asCell();
        let r1: Int = (c1 == null) ? 0 : 1;
        
        // Add an entry so that asCell() produces a non-null Cell
        m.set(5, 55);
        let c2: Cell? = m.asCell();
        let r2: Int = (c2 == null) ? 0 : 1;
        
        // Expected: r1 = 0 and r2 = 1, so total = 1
        return r1 + r2;
    }
}

// Test 9: Map with Bool as value type
contract TestBoolMap {
    get fun run() : Int {
         let m: map<Int, Bool> = emptyMap();
         m.set(111, true);
         let x: Bool = m.get(111)!!;
         return x ? 1 : 0; // expected: 1
    }
}
