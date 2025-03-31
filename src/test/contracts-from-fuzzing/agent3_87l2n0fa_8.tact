struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
         // Dump a primitive Int
         dump(123);

         // Dump a primitive Bool
         dump(false);

         // Dump a null value
         dump(null);

         // Dump an optional with a value
         let optVal: Int? = 456;
         dump(optVal);

         // Dump an optional with null
         let optNull: Int? = null;
         dump(optNull);

         // Dump a struct converted to a Cell (using toCell())
         dump(MyStruct{ a: 42, b: false }.toCell());

         // Dump a Slice created from a raw slice
         dump(rawSlice("deadbeef"));

         // Dump a Builder (after storing an Int)
         let builder: Builder = beginCell().storeInt(789, 32);
         dump(builder);

         // Convert the Builder to a Cell and dump it
         let cell: Cell = builder.endCell();
         dump(cell);

         // Obtain a Slice from the Cell and dump it
         dump(cell.asSlice());

         // Dump the result of an emit call (should show void)
         dump(emit("test".asComment()));
    }
}
