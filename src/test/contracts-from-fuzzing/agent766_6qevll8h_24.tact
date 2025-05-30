// nested contract params with structs inside constructor params
struct Params {
    val: Int;
    flag: Bool;
    note: String?;
}

contract ParamsTest(
    data: Params?
) {
    // no init
}