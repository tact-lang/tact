struct AllPrimitives {
    i: Int;
    b: Bool;
    s: String;
}

contract PrimStructTest {
    val: AllPrimitives;

    init() {
        self.val = AllPrimitives{
            i: 1,
            b: true,
            s: "s"
        };
    }
}