contract TestMapReturn {
    m: map<Int, Bool> = emptyMap();
    
    receive() {}

    get fun getM(): map<Int, Bool> {
        return self.m;
    }
}
