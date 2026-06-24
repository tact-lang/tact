struct Dummy { x: Int; y: Int }

fun testDummy() : Int {
    let Dummy { x, y } = Dummy { x: 10, y: 5 };
    return x + y;
}
