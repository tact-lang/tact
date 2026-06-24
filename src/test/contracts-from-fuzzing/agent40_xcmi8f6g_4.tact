contract TestContract {
    const MY_CONSTANT: Int = 42;
    
    receive() {
        let result: Int = self.MY_CONSTANT;
    }
}
