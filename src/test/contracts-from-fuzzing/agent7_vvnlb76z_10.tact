contract TestUnusedGetter {
    get fun unusedGet(): Int {
         return 777;
    }
    
    receive() {}
}
