contract TestUnusedGetter {
    v: Int = 123;

    receive() {}

    // Unused getter, declared but never explicitly called
    get fun unusedGetter(): Int {
         return self.v;
    }
}
