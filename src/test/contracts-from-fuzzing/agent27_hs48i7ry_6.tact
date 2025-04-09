contract Test {
    const MY_CONSTANT: Int = 42;
    
    receive() {
        require(self.MY_CONSTANT == 42, "ok");
    }
}
