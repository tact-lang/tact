struct MyStruct {
    x: Int;
}

contract TestMapStruct {
    m: map<Int, MyStruct> = emptyMap();

    receive() {
         // Insert a struct in the map
         let val: MyStruct = MyStruct{ x: 42 };
         self.m.set(1, val);
         
         // Retrieve the struct and dump its field
         let retrieved: MyStruct? = self.m.get(1);
         if (retrieved != null) {
             dump(retrieved!!.x); // expected output: 42
         } else {
             dump(0);
         }
    }
}
