struct Inner {
    val: Int;
    flag: Bool;
    txt: String;
}

contract TestContract {
    data: Inner;    

    init() {
        self.data = Inner{
            val: 1,
            flag: true,
            txt: "hello"
        };
    }
}