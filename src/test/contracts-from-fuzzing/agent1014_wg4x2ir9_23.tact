struct Params {
    name: String = "Satoshi";
    age: Int?;
    value: Int = 100;
}

contract Test {
    val: Params = Params{ age: null };
}
