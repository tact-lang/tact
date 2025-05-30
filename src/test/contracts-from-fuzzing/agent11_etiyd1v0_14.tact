contract MapArithmeticTest {
    // A map with Int keys and Int values
    a: map<Int, Int>;

    init() {
        self.a = emptyMap();
        // Using arithmetic expressions as keys
        // Note: In integer arithmetic, 1/2 typically equals 0 (integer division) in many languages
        self.a.set(1 / 2, 111);
        self.a.set(2 + 2, 222);
        self.a.set(-100, -1000);
        self.a.set(1_000_000, 1);
    }

    // Getter to retrieve value set with key (1 / 2)
    get fun testHalf() : Int {
        return self.a.get(1 / 2)!!;
    }

    // Getter to retrieve value set with key (2 + 2)
    get fun testFour() : Int {
        return self.a.get(2 + 2)!!;
    }

    // Getter to retrieve value set with key -100
    get fun testNegative() : Int {
        return self.a.get(-100)!!;
    }

    // Getter to retrieve value set with key 1_000_000
    get fun testLarge() : Int {
        return self.a.get(1_000_000)!!;
    }
}
