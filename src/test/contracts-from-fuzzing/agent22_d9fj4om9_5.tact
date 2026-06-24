contract TestEdge2 {
    fun earlyIf() : Int {
        if (1 == 1) { return 10; } else { return 20; }
    }
    
    receive () {}
}
