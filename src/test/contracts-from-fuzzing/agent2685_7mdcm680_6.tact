struct ParamTest {
    val1: Int;
    val2: Bool?;
    val3: String;
    val4: Int?;
}

contract CTest {
    foo: ParamTest = ParamTest{
        val1:42,
        val2:true,
        val3:"Hi",
        val4:null
    };
}
