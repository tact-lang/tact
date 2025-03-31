contract TestMapSetGet {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(10, 100);
    }

    receive() {
         let value: Int? = self.m.get(10);
    }
}
