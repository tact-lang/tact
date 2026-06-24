struct OptBool {
    flag: Bool?;
}

contract Test {
    b: OptBool = OptBool{ flag: null };
}