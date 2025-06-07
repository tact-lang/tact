contract TestBlockReturnNoSemicolon {
    fun test() : Int {
         { return 99 }
    }
}
