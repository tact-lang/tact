struct MyStruct { field: Int; }

contract TestStructInstantiation {
    receive() {
         // Instantiate the struct and access its field
         dump(MyStruct{ field: 42 }.field);
    }
}
