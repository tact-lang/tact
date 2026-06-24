contract TestGetter {
    x: Int;
    
    init() {
         self.x = 123;
    }
    
    get fun getterModify(): Int {
         self.x = 456; // attempt to modify state variable inside getter
         return self.x;
    }
}
