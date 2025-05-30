asm fun answer(): Int { 42 INT }

contract TestAnswer {
    receive() {}
    
    fun test(): Int {
        return answer();
    }
}
