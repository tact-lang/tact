contract TestForceGet {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(1, 100);
    }

    receive () {}

    get fun getValueForced(key: Int): Int {
         return self.m.get(key)!!;
    }
}
