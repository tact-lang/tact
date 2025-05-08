struct WrapOptStruct {
    val: Int;
    optional: String?;
}

contract WrapOptContract {
    mywrap: WrapOptStruct;

    init() {
        self.mywrap = WrapOptStruct{
            val: 77,
            optional: null,
        };
    }
}