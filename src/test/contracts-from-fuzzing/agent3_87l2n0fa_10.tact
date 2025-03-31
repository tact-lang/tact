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

         // Dump a struct by converting it to a Cell
         dump(MyStruct{ a: 42, b: false }.toCell());

         // Dump a Slice created from a raw slice of hex data
         dump(rawSlice("deadbeef"));

         // Dump a simple string
         dump("Hello, debug");

         // Dump an empty map and then a map with an element
         let emptyM: map<Int, Int> = emptyMap();
         dump(emptyM);
         let m: map<Int, Int> = emptyMap();
         m.set(2 + 2, 4);
         dump(m);

         // Dump a Builder: store an Int into a new Cell builder
         let builder: Builder = beginCell().storeInt(789, 32);
         dump(builder);

         // Convert the Builder to a Cell and dump the Cell
         let cell: Cell = builder.endCell();
         dump(cell);

         // Dump a Slice obtained from the Cell
         let sl: Slice = cell.asSlice();
         dump(sl);

         // Dump the result of an emit() call (which returns void)
         dump(emit("test".asComment()));
    }
}
