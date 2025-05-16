struct Pair {
    a: Int;
    b: Bool;
}

contract TestGetterStruct {
    sp: Pair = Pair { a: 100, b: true };

    receive() {}

    get fun getPair(): Pair {
         return self.sp;
    }
}
