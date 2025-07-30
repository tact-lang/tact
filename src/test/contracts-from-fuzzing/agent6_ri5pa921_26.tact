struct Foo { x: Int; }

contract MapStructTest {
    get fun test() : Int {
         let m: map<Int, Foo> = emptyMap();
         m.set(1, Foo { x: 10 });
         return (m.get(1)!!).x;
    }
}

contract MapBoolTest {
    get fun test() : Int {
         let m: map<Int, Bool> = emptyMap();
         m.set(5, true);
         return m.get(5)!! ? 1 : 0;
    }
}

contract MapCellTest {
    get fun test() : Int {
         let m: map<Int, Cell> = emptyMap();
         let c = beginCell().storeUint(42, 8).endCell();
         m.set(1, c);
         let c2 = m.get(1)!!;
         let num = c2.beginParse().loadUint(8);
         return num;
    }
}
