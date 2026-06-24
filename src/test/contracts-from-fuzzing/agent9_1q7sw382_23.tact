contract ParamContract(
    x: Int,
    y: Int
) {
    get fun sum(): Int {
        return self.x + self.y;
    }
}
