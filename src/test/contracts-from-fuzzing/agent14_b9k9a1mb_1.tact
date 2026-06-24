contract TestGetter {
    x: Int;

    init() {
        self.x = 1;
    }

    get fun test(): Int {
         self.x = 42; // modify x
         return self.x;
    }
}
