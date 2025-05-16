struct A {
    flag: Bool;
    num: Int as int64;
    text: String;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{ flag:true, num:12345, text:"abc" };
    }
}