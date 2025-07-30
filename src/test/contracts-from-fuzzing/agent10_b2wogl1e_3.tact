contract TestArithmetic() {
    fun run() {
        let five = 5;
        let four = 4;
        let result = five + four - five * four / five % four;
        require(result == 9, "Arithmetic failed");
    }
    receive() {
         self.run();
    }
}
