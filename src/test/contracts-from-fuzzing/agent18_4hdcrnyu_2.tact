contract TestGetter {
    x: Int;

    init() {
        self.x = 42;
    }

    // Getter function trying to modify state
    get fun getterModify() : Int {
         self.x = self.x + 1;
         return self.x;
    }
}
