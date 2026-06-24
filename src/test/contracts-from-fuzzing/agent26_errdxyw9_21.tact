contract InlineInit {
    inline fun getMyInit() : StateInit {
        return initOf InlineInit();
    }
    
    fun test() : Bool {
        let s: StateInit = self.getMyInit();
        // Compare the code cell to emptyCell to ensure it's non-empty (as a simple check)
        return s.code != emptyCell();
    }
}
