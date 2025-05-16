struct MyStruct {
    inner: map<Int, Int>;
}

contract TestNestedMapStruct {
    receive() {
        let inner: map<Int, Int> = emptyMap();
        inner.set(1, 111);
        let s: MyStruct = MyStruct{ inner: inner };
        let outer: map<Int, MyStruct> = emptyMap();
        outer.set(10, s);
        let s_fetched: MyStruct? = outer.get(10);
        if (s_fetched != null) {
            let unwrapped: MyStruct = s_fetched!!;
            let value: Int? = unwrapped.inner.get(1);
            if (value != null) {
                dump(value); // expected output: 111
            } else {
                dump(0);
            }
        } else {
            dump(0);
        }
    }
}
