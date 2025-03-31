contract TestGetter {
    x: Int;

    init() {
         self.x = 1;
    }

    get fun getAndModify(): Int {
         self.x = self.x + 1;
         return self.x;
    }

    fun check(): Int {
         return self.x;
    }

    fun main() {
         dump(self.getAndModify()); // Expected runtime output: 2
         dump(self.check());        // Expected runtime output: 1 if state modifications in getter are not persisted
    }
}
