contract TestMapEquality {
    get fun test() : Bool {
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();
         m1.set(1, 100);
         m1.set(2, 200);
         m2.set(2, 200);
         m2.set(1, 100);
         let eq: Bool = (m1 == m2);
         return eq && m1.deepEquals(m2);
    }
}

contract TestAddressMap {
    get fun test() : Int {
         let m: map<Address, Int> = emptyMap();
         m.set(myAddress(), 999);
         return m.get(myAddress())!!;
    }
}

contract TestMapNullComparison {
    get fun test() : Int {
         let m: map<Int, Int> = emptyMap();
         return (m == null) ? 1 : 0;
    }
}

contract TestMapRange {
    get fun test() : Int {
         let m: map<Int as uint8, Int as uint8> = emptyMap();
         // This key (256) is out-of-bound for uint8 (0-255) if checked at runtime.
         m.set(256, 100);
         return m.get(256)!!;
    }
}

contract TestPersistentMapIteration {
    // Persistent state field; persistent maps are auto-initialized to empty
    fizz: map<Int, Int>;

    init() {
         self.fizz = emptyMap();
         self.fizz.set(3, 30);
         self.fizz.set(4, 40);
    }

    get fun test() : Int {
         let sum: Int = 0;
         foreach (k, v in self.fizz) {
             // Update sum using augmented assignment
             sum += v;
         }
         return sum;
    }
}
