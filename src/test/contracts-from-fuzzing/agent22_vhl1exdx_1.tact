contract TestGetter1 {
    x: Int = 42;
    receive() {}
    
    get fun getX(): Int {
         return self.x;
    }
}
