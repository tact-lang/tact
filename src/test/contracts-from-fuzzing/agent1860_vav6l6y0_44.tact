struct InnerBool {
    flag: Bool;
}

contract BoolStructField {
    data: InnerBool = InnerBool{ flag: true };
}