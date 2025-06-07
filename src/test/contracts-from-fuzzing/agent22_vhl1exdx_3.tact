struct MyComposite {
    a: Int;
    b: Bool;
}

contract TestGetterComposite {
    v: Int = 100;
    flag: Bool = false;

    receive() {}

    get fun getComposite(): MyComposite? {
         return MyComposite { a: self.v, b: self.flag };
    }
}
