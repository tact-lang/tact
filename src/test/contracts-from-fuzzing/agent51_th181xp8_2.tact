contract TestOptionalValid() {
    fun run() {
        let x: Int? = 5;
        let y = x!!;
        // y should be 5
    }
}
