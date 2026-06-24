contract StateMapIteration {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(5, 55);
         self.m.set(10, 110);
    }

    get fun test() : Int {
         let s = 0;
         foreach (k, v in self.m) {
             s = s + v;
         }
         return s;
    }
}

contract MapComputedKey {
    get fun test() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1 + 2, 300); // key computed as 3
         return m.get(1 + 2)!!; // should return 300
    }
}
