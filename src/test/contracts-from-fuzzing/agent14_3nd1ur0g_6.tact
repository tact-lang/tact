contract TestGetterMap {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(1, 100);
         self.m.set(2, 200);
    }

    receive() {}

    get fun getMap(): map<Int, Int> {
         return self.m;
    }
}
