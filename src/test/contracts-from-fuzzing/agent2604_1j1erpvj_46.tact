struct OptionalZeros {
    a:Int?=null;
    b:Int?=null;
    c:Int?=null;
}

contract ZeroOptTest {
    val: OptionalZeros;

    init(){
        self.val = OptionalZeros{};
    }
}