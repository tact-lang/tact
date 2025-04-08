struct MyStruct {
    a: Int?;
}

contract TestContract {
    m: MyStruct;

    init() {
        self.m = MyStruct { a: null };
    }

    get fun getA(): Int? {
        return self.m.a;
    }

    get fun mustCrash(): Int {
        return self.m.a!!;
    }
}