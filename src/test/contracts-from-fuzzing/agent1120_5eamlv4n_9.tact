struct ParamTest {
    p1: Int;
    p2: Int?;
    p3: Bool;
    p4: Bool?;
    p5: String;
    p6: String?;
}

contract LargeParams(
    param: ParamTest,
) {
    receive() {
        let x = 1; // force inclusion
    }
}