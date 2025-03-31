contract A {
    init() {
    }
}

contract B {
    fun getAInit(): StateInit {
        return initOf A();
    }
    
    receive() {
        let s = initOf A();
    }
}
