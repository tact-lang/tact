struct Params {
    flag: Bool = true;
    name: String = "x";
    age: Int?;
}

contract DefaultedStructContract {
    p: Params = Params{ };
}