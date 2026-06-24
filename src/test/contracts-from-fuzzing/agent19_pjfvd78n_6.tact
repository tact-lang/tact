contract TestMapExists {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(5, 50);
    }

    receive() {
         let exists5: Bool = self.m.exists(5);
         let exists7: Bool = self.m.exists(7);
    }
}
