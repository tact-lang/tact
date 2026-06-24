contract MapTest {
    m: map<Int, Int>;

    init() {
        // Initialize map to emptyMap
        self.m = emptyMap();

        // Set key 10 to value 100 and dump the result
        self.m.set(10, 100);
        let v1 = self.m.get(10)!!; // should be 100
        dump(v1); // expected output: 100

        // Override key 10 with value 200
        self.m.set(10, 200);
        let v2 = self.m.get(10)!!; // expected 200
        dump(v2); // expected output: 200

        // Delete key 10
        let d1 = self.m.del(10); // expected true
        dump(d1); // expected output: true

        // Delete key 10 again (idempotent deletion)
        let d2 = self.m.del(10); // expected false
        dump(d2); // expected output: false

        // Check existence of key 10
        let exists = self.m.exists(10); // expected false
        dump(exists); // expected output: false

        // Shallow equality: m should be equal to emptyMap now
        dump(self.m == emptyMap()); // expected output: true

        // Create a new map m2 and set key 20 to value 300
        let m2: map<Int, Int> = emptyMap();
        m2.set(20, 300);
        dump(self.m == m2); // expected output: false

        // For further testing, convert m2 to cell and dump its nullity
        let cellM2 = m2.asCell();
        dump(cellM2); // expected output: null, since m2 is not empty? Actually, empty maps are null
    }

    receive() {
        cashback(sender());
    }

    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}

fun main() {}
