contract TestGetter {
    x: Int;
    
    init() {
       self.x = 1;
    }
    
    // getter that modifies state variable
    get fun getX(): Int {
       self.x = 2;
       return self.x;
    }
}
