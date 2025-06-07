struct Info {
    name: String = "n";
    age: Int;
}

contract ParamsTest(
    info: Info,
    flag: Bool,
) {
    // deliberate empty, no init() allowed
}