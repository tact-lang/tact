struct MyStruct {
    v: Int;
}

contract TestStructValue {
    get fun test(): Int {
         let m: map<Int, MyStruct> = emptyMap();
         let s: MyStruct = MyStruct{ v: 123 };
         m.set(1, s);
         return m.get(1)!!.v;
    }
}
