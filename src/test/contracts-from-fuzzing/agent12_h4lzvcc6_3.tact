contract D {
    fun getEInit(): StateInit {
         return initOf E();
    }
    receive() {}
}

contract E {
    fun getDInit(): StateInit {
         return initOf D();
    }
    receive() {}
}
