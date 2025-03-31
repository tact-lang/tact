struct MyStruct {
    innerMap: map<Int, Int>;
}

contract TestNestedMap {
    m: map<Address, MyStruct>;

    init() {
        self.m = emptyMap();
        let ms: MyStruct = MyStruct{ innerMap: emptyMap() };
        ms.innerMap.set(1, 100);
        self.m.set(myAddress(), ms);

        let ms2: MyStruct? = self.m.get(myAddress());
        if (ms2 == null) { throw(0); }
        let val: Int? = ms2!!.innerMap.get(1);
        if (val == null || val!! != 100) { throw(1); }
    }

    receive() {}
}
