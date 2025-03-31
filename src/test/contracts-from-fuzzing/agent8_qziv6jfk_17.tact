contract TestGetterChain {
    x: Int = 100;
    
    receive() {}
    
    get fun getX(): Int {
         return self.x;
    }
    
    get fun getDoubleX(): Int {
         return self.getX() * 2; // calling one getter from another
    }
}
