struct DefaultParams {
    name: String = "Default";
    age: Int? = null;
    score: Int = 100;
}

fun testDefault() {
    let d = DefaultParams { };
}
