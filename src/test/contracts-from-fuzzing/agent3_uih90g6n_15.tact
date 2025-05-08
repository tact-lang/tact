contract TestAsCell {
    m: map<Int, Int> = emptyMap();
    
    receive() {
         // When empty, asCell() should return null
         dump(self.m.asCell());
         
         // After inserting a value, asCell() should return a non-null Cell
         self.m.set(1, 42);
         dump(self.m.asCell());
    }
}
