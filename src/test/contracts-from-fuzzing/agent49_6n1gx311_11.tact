contract TestExtensionCall {
    fun getStr(): String {
        return 123.toString();
    }
    
    receive() {
        dump(self.getStr());
    }
}
