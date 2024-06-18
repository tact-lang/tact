struct S {
    a: Bool;
    b: Int;
}

struct T {
    a: Int;
    s: S;
}

struct MyStruct1 {
    a: Int;
    b: Int as uint32;
    c: Int?;
}

struct MyStruct2 {
    m: map<Int, Int as uint64>;
    s: MyStruct1?;
}

contract StructsTester {
    s1: S = S {a: false, b: 21 + 21};
    s2: S;
    t1: T = T {a: 43, s: S {a: true, b: 44}};
    t2: T;

    init() {
        self.s2 = S {a: false || false, b: 42};
        self.t2 = T {a: 40 + 3, s: S {a: true && true, b: 44 | 4}};
    }

    // Deploy
    receive() { }

    get fun structInitializerTest(): Bool {
        return self.s1.a == self.s2.a && self.s1.b == self.s2.b &&
               self.t1.a == self.t2.a &&
               self.t1.s.a == self.t2.s.a && self.t1.s.b == self.t2.s.b;
    }

     get fun toCell1(s: MyStruct1): Cell {
        return s.toCell();
    }

    get fun fromCell1(src: Cell): MyStruct1 {
        let s = MyStruct1.fromCell(src);
        return s;
    }

    get fun fromSlice1(src: Slice): MyStruct1 {
        return MyStruct1.fromSlice(src);
    }

    get fun toCell2(s: MyStruct2): Cell {
        return s.toCell();
    }

    get fun fromCell2(src: Cell): MyStruct2 {
        let s: MyStruct2 = MyStruct2.fromCell(src);
        return s;
    }

    get fun fromSlice2(src: Slice): MyStruct2 {
        let s: MyStruct2 = MyStruct2.fromSlice(src);
        return s;
    }

    get fun test1(s1: MyStruct1, s2: MyStruct2): Cell {
        let c: Cell = beginCell().storeRef(s1.toCell()).storeRef(s2.toCell()).endCell();
        let s: Slice = c.beginParse();
        let s1_: MyStruct1 = MyStruct1.fromCell(s.loadRef());
        let s2_: MyStruct2 = MyStruct2.fromSlice(s.loadRef().beginParse());
        return beginCell().storeRef(s1_.toCell()).storeRef(s2_.toCell()).endCell();
    }
}