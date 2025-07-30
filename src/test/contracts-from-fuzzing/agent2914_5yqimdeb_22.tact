contract ParamsWithStuff(
    x: Int,
) {
    const A: Int = 7;

    get fun getX(): Int {
        return self.x;
    }
}
