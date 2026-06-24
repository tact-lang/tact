struct MyStruct {
    x: Int;
    y: Bool;
}

contract MapReplaceNullStructTest {
    m: map<Int, MyStruct> = emptyMap();

    receive() {
        let s: MyStruct = MyStruct { x: 10, y: false };
        self.m.set(1, s);
        
        // Replace the struct at key 1 by null, which should delete the entry and return the old value
        let old: MyStruct? = self.m.replaceGet(1, null);
        dump(old!!.x); // Expected to dump 10

        // Verify that the key 1 no longer exists
        let check: MyStruct? = self.m.get(1);
        dump(check == null); // Expected to dump true
    }
}
