struct IntOptTest {
    a: Int;
    b: Int?;
}

contract OptIntField {
    val: IntOptTest = IntOptTest{ a: 12, b: null };
}