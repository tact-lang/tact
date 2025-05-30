struct S {
    x: Int;
    y: Bool;
}

contract ParamContract(
    param: S,
) {
    get fun get_x(): Int {
        return self.param.x;
    }
}
