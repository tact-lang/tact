struct OptNested {
    x: Int;
    y: Int?;
}

contract OptDefTest {
    v: OptNested = OptNested{ x: 99 };
}