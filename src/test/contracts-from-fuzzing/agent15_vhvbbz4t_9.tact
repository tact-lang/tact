contract TestMapDeepEquals {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    receive() {
         self.m1.set(1, 10);
         self.m2.set(1, 10);
         let eq = self.m1.deepEquals(self.m2);
    }
}
