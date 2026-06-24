//// Snippet 5: Testing initOf with contract parameters

contract ParamEx(x: Int, y: Int) {}

contract TestParam {
    init() {
        let pkg = initOf ParamEx(10, 20);
    }
}
