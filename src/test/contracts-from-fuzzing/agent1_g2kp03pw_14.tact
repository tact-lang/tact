contract Test {
    receive() {
        // Primitive type: Int
        dump(123);
        
        // Primitive type: Bool
        dump(true);
        dump(false);

        // Optional: Int? with null
        let opt: Int? = null;
        dump(opt);

        // Cell, Builder, Slice
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());
        
        // String
        dump("Hello, Tact debugging!");

        // Special functions: dump(emit(...)) returns void
        dump(emit("msg".asComment()));

        // Invalid type case: Struct (should fail as per documentation)
        // Uncommenting the following line should cause compile error:
        // dump(MyStruct{ a: 100 });
    }
}

struct MyStruct {
    a: Int;
}
