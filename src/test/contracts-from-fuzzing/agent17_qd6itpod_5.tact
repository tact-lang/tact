contract D {
    fun getEInit() : StateInit {
        return initOf E();
    }
    receive() {}
}

contract E {
    fun getFInit() : StateInit {
        return initOf F();
    }
    receive() {}
}

contract F {
    fun getDInit() : StateInit {
        return initOf D();
    }
    receive() {}
}
