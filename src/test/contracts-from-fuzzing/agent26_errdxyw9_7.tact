contract Params {
    init(a: Int, b: Int) { }
}

contract TestParams {
    fun getParamsInit() : StateInit {
        return initOf Params(
            1,
            2,  // allowed trailing comma
        );
    }
}
